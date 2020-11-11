//
//  YMSafeSubscriptable.swift
//  YMKit
//
//  Created by Yakov Manshin on 8/26/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

/// Adopt this protocol to prevent out-of-bounds-class errors in collections.
public protocol YMSafeSubscriptable: Collection {
    
    /// Allows subscripting collections in a safe manner, without out-of-bounds exceptions.
    ///
    /// + This protocol has a default implementation.
    ///
    /// - Parameter index: The index of an element.
    ///
    /// - Returns: The element with the specified index, if such an element exists; otherwise, `nil`.
    subscript(safe index: Index) -> Element? { get }
    
}

extension YMSafeSubscriptable {
    
    public subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
