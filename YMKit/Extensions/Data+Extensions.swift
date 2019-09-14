//
//  Data+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 6/29/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

// MARK: - Data-to-String Conversion

extension Data {
    
    /// Returns a `String` containing a representation of the `Data`.
    /// - Parameter encoding: *Required.* Encoding used for transformation.
    @inlinable
    public func getString(using encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }
    
    /// Returns a `String` containing a representation of the `Data` decoded using UTF-8.
    public var utf8String: String? {
        return self.getString(using: .utf8)
    }
    
    /// Returns a `String` containing a representation of the `Data` decoded using UTF-16.
    public var utf16String: String? {
        return self.getString(using: .utf16)
    }
    
}
