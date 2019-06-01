//
//  Int+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/14/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

// MARK: - NETWORKING

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

// MARK: - PLAIN STRINGS

extension Int {
    
    /**
     Get the `String` representation of the number.
    */
    public var stringValue: String {
        return String(self)
    }
    
}

// MARK: - PRICE STRINGS

extension Int {
    
    /// Convert `Int` values to price strings. You can optionally specify minimum and maximum numbers of fraction digits, locale, currency code, and currency symbol.
    public func getBasicPriceString(minFractionDigits: Int = 0, maxFractionDigits: Int = 3, locale: Locale = .current, currencyCode: String? = nil, currencySymbol: String? = nil) -> String? {
        return NSNumber(value: self).getBasicPriceString(minFractionDigits: minFractionDigits, maxFractionDigits: maxFractionDigits, locale: locale, currencyCode: currencyCode, currencySymbol: currencySymbol)
    }
    
    /// Convert `Int` values to price strings with the specified number of fraction digits. You can optionally specify locale, currency code, and currency symbol.
    public func getPriceStringWithFixedFractionDigits(numberOfFractionDigits: Int, locale: Locale = .current, currencyCode: String? = nil, currencySymbol: String? = nil) -> String? {
        return NSNumber(value: self).getPriceStringWithFixedFractionDigits(numberOfFractionDigits: numberOfFractionDigits, locale: locale, currencyCode: currencyCode, currencySymbol: currencySymbol)
    }
    
    /// Convert `Int` values to price strings that use significant digits formatting (see `NumberFormatter.usesSignificantDigits`). You can optionally specify minimum and maximum numbers of significant digits, locale, currency code, and currency symbol.
    public func getPriceStringUsingSignificantDigits(min: Int? = nil, max: Int? = nil, locale: Locale = .current, currencyCode: String? = nil, currencySymbol: String? = nil) -> String? {
        return NSNumber(value: self).getPriceStringUsingSignificantDigits(min: min, max: max, locale: locale, currencyCode: currencyCode, currencySymbol: currencySymbol)
    }
    
    // MARK: - DEPRECATED
    
    /// Convert `Int` values to price strings in specified locale and with optionally specified number of fraction digits.
    @available(swift, deprecated: 5.0, obsoleted: 5.1, message: "Use getBasicPriceString(minFractionDigits:maxFractionDigits:locale:currencyCode:currencySymbol:), getPriceStringWithFixedFractionDigits(numberOfFractionDigits:locale:currencyCode:currencySymbol:), or getPriceStringUsingSignificantDigits(min:max:locale:currencyCode:currencySymbol:), depending on your needs")
    public func getPriceString(in locale: Locale = .current, fixedFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(in: locale, fixedFractionDigits: fixedFractionDigits)
    }
    
    /// Convert `Int` values to price strings with specified currency code and optionally specified number of fraction digits.
    @available(swift, deprecated: 5.0, obsoleted: 5.1, message: "Use getBasicPriceString(minFractionDigits:maxFractionDigits:locale:currencyCode:currencySymbol:), getPriceStringWithFixedFractionDigits(numberOfFractionDigits:locale:currencyCode:currencySymbol:), or getPriceStringUsingSignificantDigits(min:max:locale:currencyCode:currencySymbol:), depending on your needs")
    public func getPriceString(currencyCode: String? = nil, fixedFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(currencyCode: currencyCode, fixedFractionDigits: fixedFractionDigits)
    }
    
    /// Convert `Int` values to price strings with specified currency symbol and optionally specified number of fraction digits.
    @available(swift, deprecated: 5.0, obsoleted: 5.1, message: "Use getBasicPriceString(minFractionDigits:maxFractionDigits:locale:currencyCode:currencySymbol:), getPriceStringWithFixedFractionDigits(numberOfFractionDigits:locale:currencyCode:currencySymbol:), or getPriceStringUsingSignificantDigits(min:max:locale:currencyCode:currencySymbol:), depending on your needs")
    public func getPriceString(withCurrencySymbol currencySymbol: String = "", fixedFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(withCurrencySymbol: currencySymbol, fixedFractionDigits: fixedFractionDigits)
    }
    
    /// Convert Int values to price strings in specified locale and with specified number of fraction digits.
    @available(swift, deprecated: 5.0, obsoleted: 5.1, renamed: "getPriceString(in:fixedFractionDigits:)")
    public func getPriceString(in locale: Locale = .current, numberOfFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(in: locale, numberOfFractionDigits: numberOfFractionDigits)
    }
    
    /// Convert Int values to price strings with specified currency code and number of fraction digits.
    @available(swift, deprecated: 5.0, obsoleted: 5.1, renamed: "getPriceString(currencyCode:fixedFractionDigits:)")
    public func getPriceString(currencyCode: String? = nil, numberOfFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(currencyCode: currencyCode, numberOfFractionDigits: numberOfFractionDigits)
    }
    
    /// Convert Int values to price strings with specified currency symbol and number of fraction digits.
    @available(swift, deprecated: 5.0, obsoleted: 5.1, renamed: "getPriceString(withCurrencySymbol:fixedFractionDigits:)")
    public func getPriceString(withCurrencySymbol currencySymbol: String = "", numberOfFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(withCurrencySymbol: currencySymbol, numberOfFractionDigits: numberOfFractionDigits)
    }
    
}
