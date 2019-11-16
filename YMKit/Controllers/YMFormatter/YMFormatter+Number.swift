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
