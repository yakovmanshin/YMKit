//
//  YMFormatter+Date.swift
//  YMKit
//
//  Created by Yakov Manshin on 11/16/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

// MARK: - Core Declaration

extension YMFormatter {
    
    /// A collection of methods that allow formatting `Date`s as other types, mainly `String`s.
    public struct Date {
        
        // MARK: Properties
        
        /// The `Date` that will be used as formatter input.
        public let date: Foundation.Date
        
        /// The `DateFormatter` that actually does the job of creating a `String` from `date`.
        private let dateFormatter: DateFormatter
        
        // MARK: Initializers
        
        public init(_ date: Foundation.Date) {
            self.date = date
            self.dateFormatter = DateFormatter()
        }
        
        /// This initializer is primarily purposed for unit testing.
        init(_ date: Foundation.Date, dateFormatter: DateFormatter) {
            self.date = date
            self.dateFormatter = dateFormatter
        }
        
    }
    
}
