//
//  YMFormatter+Number.swift
//  YMKit
//
//  Created by Yakov Manshin on 11/16/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

// MARK: - Core Declaration

extension YMFormatter {
    
    /// A collection of methods that allow formatting numbers as other types, primarily `String`s.
    public struct Number {
        
        /// The number that will be used as formatter input.
        let number: NSNumber
        
        /// The `NumberFormatter` that actually does the job of creating a `String` from `number`.
        let numberFormatter: NumberFormatter
        
        public init(_ number: NSNumber) {
            self.number = number
            self.numberFormatter = NumberFormatter()
        }
        
        /// This initializer is primarily purposed for unit testing.
        init(_ number: NSNumber, numberFormatter: NumberFormatter) {
            self.number = number
            self.numberFormatter = numberFormatter
        }
        
    }
    
}

// MARK: - Additional Initializers

public extension YMFormatter.Number {
    
    init(_ number: Int) {
        let nsNumber = NSNumber(value: number)
        self.init(nsNumber)
    }
    
    init(_ number: Float) {
        let nsNumber = NSNumber(value: number)
        self.init(nsNumber)
    }
    
    init(_ number: Double) {
        let nsNumber = NSNumber(value: number)
        self.init(nsNumber)
    }
    
}

// MARK: - Number String

public extension YMFormatter.Number {
    
    /// Creates a `String` representation of `number`.
    /// 
    /// - Parameters:
    ///   - configurationClosure: *Required.* The block of code that configures `NumberFormatter` before the latter is used for transforming
    ///   `number` into a `String`. Use this opportunity to set locale, currency code (if needed), rounding rules, and more. See
    ///   [documentation](https://developer.apple.com/documentation/foundation/numberformatter) for all properties available
    ///   to configure.
    ///   - numberFormatter: The `NumberFormatter` that can be configured by the caller.
    func makeString(
        using configurationClosure: (_ numberFormatter: NumberFormatter) -> Void
    ) -> String? {
        configurationClosure(numberFormatter)
        return numberFormatter.string(from: number)
    }
    
}
