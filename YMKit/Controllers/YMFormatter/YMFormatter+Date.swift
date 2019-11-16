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

// MARK: - Date String

public extension YMFormatter.Date {
    
    /// Creates a `String` representation of `date`.
    ///
    /// - Parameters:
    ///   - configurationClosure: *Required.* The block of code that configures `DateFormatter` before the latter is used for transforming `date`
    ///   into a `String`. Use this opportunity to set date and time style, locale, and more options. See
    ///   [documentation](https://developer.apple.com/documentation/foundation/DateFormatter) for all properties available to configure.
    ///   - dateFormatter: The `DateFormatter` that can be configured by the caller.
    func makeString(
        using configurationClosure: (_ dateFormatter: DateFormatter) -> Void
    ) -> String {
        configurationClosure(dateFormatter)
        return dateFormatter.string(from: date)
    }
    
}
