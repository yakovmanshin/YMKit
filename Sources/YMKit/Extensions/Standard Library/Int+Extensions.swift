//
//  Int+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/14/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

// MARK: - Networking

extension Int {
    
    public typealias HTTPStatusCode = Int
    
    /**
     Check whether the specified number is a success HTTP status code.
     + Success HTTP status codes are numbers between 200 and 299.
    */
    public var isHTTPSuccess: Bool {
        return (200..<300).contains(self)
    }
    
}
