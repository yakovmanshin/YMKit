//
//  HTTPStatusCode.swift
//  YMKitNetworking
//
//  Created by Yakov Manshin on 5/30/21.
//  Copyright © 2021 Yakov Manshin. All rights reserved.
//

public typealias HTTPStatusCode = Int

extension HTTPStatusCode {
    
    /// Indicates whether the receiver is a valid HTTP status code.
    public var isStatusCode: Bool {
        (100..<600).contains(self)
    }
    
    /// Indicates whether the specified code corresponds to a success.
    public var isSuccess: Bool {
        (200..<300).contains(self)
    }
    
    /// Indicates whether the specified code corresponds to a client error.
    public var isClientError: Bool {
        (400..<500).contains(self)
    }
    
    /// Indicates whether the specified code corresponds to a server error.
    public var isServerError: Bool {
        (500..<600).contains(self)
    }
    
}
