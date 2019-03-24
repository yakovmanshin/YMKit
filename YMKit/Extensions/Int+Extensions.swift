//
//  Int+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/14/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

// NETWORKING

extension Int {
    
    public typealias HTTPStatusCode = Int
    
    /**
     Check whether the specified number is a success HTTP status code.
     + Success HTTP status codes are numbers between 200 and 299.
    */
    public var isHTTPSuccess: Bool {
        return NSRange(location: 200, length: 100).contains(self)
    }
    
}

// PRICE STRINGS

extension Int {
    
    /// Convert Int values to price strings in specified locale and with specified number of fraction digits.
    public func getPriceString(in locale: Locale = .current, numberOfFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(in: locale, numberOfFractionDigits: numberOfFractionDigits)
    }
    
    /// Convert Int values to price strings with specified currency code and number of fraction digits.
    public func getPriceString(currencyCode: String? = nil, numberOfFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(currencyCode: currencyCode, numberOfFractionDigits: numberOfFractionDigits)
    }
    
    /// Convert Int values to price strings with specified currency symbol and number of fraction digits.
    public func getPriceString(withCurrencySymbol currencySymbol: String = "", numberOfFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(withCurrencySymbol: currencySymbol, numberOfFractionDigits: numberOfFractionDigits)
    }
    
}
