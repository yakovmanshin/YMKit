//
//  Int+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/14/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

// MARK: - Networking

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

// MARK: - Price Strings

extension Int {
    
    /// Convert `Int` values to price strings. You can optionally specify minimum and maximum numbers of fraction digits, locale, currency code, and currency symbol.
    public func getBasicPriceString(
        minFractionDigits: Int = 0,
        maxFractionDigits: Int = 3,
        locale: Locale = .current,
        currencyCode: String? = nil,
        currencySymbol: String? = nil
    ) -> String? {
        return NSNumber(value: self).getBasicPriceString(
            minFractionDigits: minFractionDigits,
            maxFractionDigits: maxFractionDigits,
            locale: locale,
            currencyCode: currencyCode,
            currencySymbol: currencySymbol
        )
    }
    
    /// Convert `Int` values to price strings with the specified number of fraction digits. You can optionally specify locale, currency code, and currency symbol.
    public func getPriceStringWithFixedFractionDigits(
        numberOfFractionDigits: Int,
        locale: Locale = .current,
        currencyCode: String? = nil,
        currencySymbol: String? = nil
    ) -> String? {
        return NSNumber(value: self).getPriceStringWithFixedFractionDigits(
            numberOfFractionDigits: numberOfFractionDigits,
            locale: locale,
            currencyCode: currencyCode,
            currencySymbol: currencySymbol
        )
    }
    
    /// Convert `Int` values to price strings that use significant digits formatting (see `NumberFormatter.usesSignificantDigits`). You can optionally specify minimum and maximum numbers of significant digits, locale, currency code, and currency symbol.
    public func getPriceStringUsingSignificantDigits(
        min: Int? = nil,
        max: Int? = nil,
        locale: Locale = .current,
        currencyCode: String? = nil,
        currencySymbol: String? = nil
    ) -> String? {
        return NSNumber(value: self).getPriceStringUsingSignificantDigits(
            min: min,
            max: max,
            locale: locale,
            currencyCode: currencyCode,
            currencySymbol: currencySymbol
        )
    }
    
}
