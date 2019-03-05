//
//  YMSafeSubscripting.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/21/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

/// Adopt this protocol to prevent out-of-bounds-class errors in collections.
public protocol YMSafeSubscripting: Collection {
    
    subscript(safe index: Index) -> Element? { get }
    
}

extension YMSafeSubscripting {
    
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}

extension Array: YMSafeSubscripting { }
