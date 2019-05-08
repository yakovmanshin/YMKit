//
//  YMSafeSubscripting.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/21/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

/// Adopt this protocol to prevent out-of-bounds-class errors in collections.
public protocol YMSafeSubscripting: Collection {
    
    /**
     Subscript collections if a safe manner.
     + With this method, you’ll never get the out-of-bounds error, and your code will not crash.
     - Parameters:
        - index: the element index
     - Returns: An element with the specified index, if it exists; otherwise, `nil`.
    */
    subscript(safe index: Index) -> Element? { get }
    
}

extension YMSafeSubscripting {
    
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}

extension Array: YMSafeSubscripting { }
