//
//  YMJSONDataCodable.swift
//  YMKit
//
//  Created by Yakov Manshin on 6/1/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

// MARK: - YMJSONDataCodable

public typealias YMJSONDataCodable = YMJSONDataDecodable & YMJSONDataEncodable

// MARK: - YMJSONDataDecodable

public protocol YMJSONDataDecodable: Decodable {
    
    init(throwingJSONData jsonData: Data) throws
    init?(jsonData: Data)
    
}

extension YMJSONDataDecodable {
    
    public init(throwingJSONData jsonData: Data) throws {
        self = try Self.initialize(from: jsonData)
    }
    
    public init?(jsonData: Data) {
        do {
            self = try Self.init(throwingJSONData: jsonData)
        } catch {
            print(error)
            return nil
        }
    }
    
    @available(*, unavailable)
    private static func initialize<T: YMJSONDataDecodable>(from jsonData: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: jsonData)
    }
    
    private static func initialize(from jsonData: Data) throws -> Self {
        return try JSONDecoder().decode(Self.self, from: jsonData)
    }
    
}

// MARK: - YMJSONDataEncodable

public protocol YMJSONDataEncodable: Encodable {
    
    func getJSONData() throws -> Data
    var jsonData: Data? { get }
    
}

extension YMJSONDataEncodable {
    
    public func getJSONData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    public var jsonData: Data? {
        do {
            return try self.getJSONData()
        } catch {
            return nil
        }
    }
    
    @available(*, unavailable)
    private static func getJSONData<V: YMJSONDataEncodable>(from value: V) throws -> Data {
        return try JSONEncoder().encode(value)
    }
    
}
