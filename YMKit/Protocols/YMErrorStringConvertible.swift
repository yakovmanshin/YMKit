//
//  YMErrorStringConvertible.swift
//  YMKit
//
//  Created by Yakov Manshin on 5/26/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

/// This protocol ensures that `Error` values always have adequare string representations.
public protocol YMErrorStringConvertible: Error {
    var stringValue: String { get }
}
