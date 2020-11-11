//
//  YMStringRepresentable.swift
//  YMKit
//
//  Created by Yakov Manshin on 6/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

/// A protocol that enforces values of the conforming type to always have nice `String` representation.
public protocol YMStringRepresentable {
    
    /// String representation of the value.
    var stringValue: String { get }
    
}

extension Int: YMStringRepresentable {
    
    public var stringValue: String {
        return String(describing: self)
    }
    
}

extension Double: YMStringRepresentable {
    
    public var stringValue: String {
        return String(describing: self)
    }
    
}
