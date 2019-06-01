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
    
    init?(jsonData: Data)
    
}

extension YMJSONDataDecodable {
    
    public init?(jsonData: Data) {
        do {
            self = try Self.initialize(from: jsonData)
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
    
    var jsonData: Data { get }
    
}

extension YMJSONDataEncodable {
    
    public var jsonData: Data? {
        do {
            return try self.getJSONData()
        } catch {
            return nil
        }
    }
    
    private func getJSONData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    @available(*, unavailable)
    private static func getJSONData<V: YMJSONDataEncodable>(from value: V) throws -> Data {
        return try JSONEncoder().encode(value)
    }
    
}
