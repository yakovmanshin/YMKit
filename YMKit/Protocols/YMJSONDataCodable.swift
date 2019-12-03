//
//  YMJSONDataCodable.swift
//  YMKit
//
//  Created by Yakov Manshin on 6/1/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

// MARK: - YMJSONDataCodable

/// A combination of `YMJSONDataDecodable` and `YMJSONDataEncodable`.
public typealias YMJSONDataCodable = YMJSONDataDecodable & YMJSONDataEncodable

// MARK: - YMJSONDataDecodable

/// A protocol that facilitates faster and easier decoding of JSON.
public protocol YMJSONDataDecodable: Decodable {
    
    /// Initializes a value from JSON `Data` using `JSONDecoder`.
    ///
    /// - Parameter jsonData: *Required.* The object's JSON representation (as `Data`).
    init(throwingWithJSONData jsonData: Data) throws
    
    /// Initializes a value from JSON `Data` using `JSONDecoder`.
    ///
    /// + If something goes wrong, the method `throws`.
    ///
    /// - Parameter jsonData: *Required.* JSON `Data`.
    @available(*, deprecated, renamed: "init(throwingWithJSONData:)")
    init(throwingJSONData jsonData: Data) throws
    
    /// Initializes a value from JSON `Data` using `JSONDecoder`.
    ///
    /// + If something goes wrong, `nil` is returned.
    ///
    /// - Parameter jsonData: *Required.* JSON `Data`.
    init?(jsonData: Data)
    
}

/// A protocol that facilitates faster and easier value encoding into JSON.
extension YMJSONDataDecodable {
    
    public init(throwingWithJSONData jsonData: Data) throws {
        self = try Self.initialize(with: jsonData)
    }
    
    public init(throwingJSONData jsonData: Data) throws {
        try self.init(throwingWithJSONData: jsonData)
    }
    
    public init?(jsonData: Data) {
        do {
            self = try Self(throwingWithJSONData: jsonData)
        } catch {
            print(error)
            return nil
        }
    }
    
    private static func initialize(with jsonData: Data) throws -> Self {
        return try JSONDecoder().decode(Self.self, from: jsonData)
    }
    
}

// MARK: - YMJSONDataEncodable

public protocol YMJSONDataEncodable: Encodable {
    
    /// Encodes the value to JSON `Data` using `JSONEncoder`.
    ///
    /// + If something goes wrong, the method `throws`.
    func getJSONData() throws -> Data
    
    /// Encodes the value to optional JSON `Data` using `JSONEncoder`.
    ///
    /// + If something goes wrong, `nil` is returned.
    var jsonData: Data? { get }
    
}

extension YMJSONDataEncodable {
    
    public func getJSONData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    public var jsonData: Data? {
        return try? self.getJSONData()
    }
    
}
