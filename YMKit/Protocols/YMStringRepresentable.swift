//
//  YMStringRepresentable.swift
//  YMKit
//
//  Created by Yakov Manshin on 6/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

public protocol YMStringRepresentable {
    
    /// String representation of the value.
    var stringValue: String { get }
    
}

extension Int: YMStringRepresentable {
    
    public var stringValue: String {
        return String(self)
    }
    
}

extension Double: YMStringRepresentable {
    
    public var stringValue: String {
        return String(self)
    }
    
}