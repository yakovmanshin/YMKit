//
//  NSNumber+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

// MARK: - PRICE STRINGS

extension NSNumber {
    
    /**
     Convert `NSNumber` values into customizable price strings.
     + By default, the method rounds numbers using “significant digits.” See `NumberFormatter.usesSignificantDigits` for more details.
     + If you specify `fixedFractionDigits`, significant digits rounding is disabled.
     - Parameters:
        - locale: the locale you’d like to use in the price string; defaults to the current locale of the device
        - currencyCode: ISO 4217-compliant currency code (such as “USD” or “EUR”)
        - currencySymbol: a symbol that represents the currency (such as “$” or “€”)
        - fixedFractionDigits: if specified, `usesSignificantDigits` is disabled, and prices are formatted with the specified number of fraction digits
        - maxSignificantDigits: maximum number of significant digits; default is 3
    */
    public func getPriceString(in locale: Locale = .current, currencyCode: String? = nil, currencySymbol: String? = nil, fixedFractionDigits: Int? = nil, maxSignificantDigits: Int = 3) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.usesGroupingSeparator = true
        
        numberFormatter.locale = locale
        
        if let currencyCode = currencyCode {
            numberFormatter.currencyCode = currencyCode
        }
        
        if let currencySymbol = currencySymbol {
            numberFormatter.currencySymbol = currencySymbol
        }
        
        if let fixedFractionDigits = fixedFractionDigits {
            numberFormatter.usesSignificantDigits = false
            numberFormatter.minimumIntegerDigits = 1
            numberFormatter.minimumFractionDigits = fixedFractionDigits
            numberFormatter.maximumFractionDigits = fixedFractionDigits
        } else {
            numberFormatter.usesSignificantDigits = true
            numberFormatter.minimumSignificantDigits = 0
            numberFormatter.maximumSignificantDigits = maxSignificantDigits
        }
        
        return numberFormatter.string(from: self)
    }
    
    /// Convert `NSNumber` values to price strings in specified locale and with optionally specified number of fraction digits.
    public func getPriceString(in locale: Locale = .current, fixedFractionDigits: Int? = nil) -> String? {
        return self.getPriceString(in: locale, currencyCode: nil, currencySymbol: nil, fixedFractionDigits: fixedFractionDigits)
    }
    
    /// Convert `NSNumber` values to price strings with specified currency code and optionally specified number of fraction digits.
    public func getPriceString(currencyCode: String? = nil, fixedFractionDigits: Int? = nil) -> String? {
        return self.getPriceString(currencyCode: currencyCode, currencySymbol: nil, fixedFractionDigits: fixedFractionDigits)
    }
    
    /// Convert `NSNumber` values to price strings with specified currency symbol and optionally specified number of fraction digits.
    public func getPriceString(withCurrencySymbol currencySymbol: String = "", fixedFractionDigits: Int? = nil) -> String? {
        return self.getPriceString(currencyCode: nil, currencySymbol: currencySymbol, fixedFractionDigits: fixedFractionDigits)
    }
    
    // MARK: - DEPRECATED
    
    /// Convert NSNumber values to price strings in specified locale and with specified number of fraction digits.
    @available(swift, deprecated: 5.0, obsoleted: 5.1, renamed: "getPriceString(in:fixedFractionDigits:)")
    public func getPriceString(in locale: Locale = .current, numberOfFractionDigits: Int? = nil) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale
        numberFormatter.minimumFractionDigits = numberOfFractionDigits ?? 0
        numberFormatter.maximumFractionDigits = numberOfFractionDigits ?? 3
        return numberFormatter.string(from: self)
    }
    
    /// Convert NSNumber values to price strings with specified currency code and number of fraction digits.
    @available(swift, deprecated: 5.0, obsoleted: 5.1, renamed: "getPriceString(currencyCode:fixedFractionDigits:)")
    public func getPriceString(currencyCode: String? = nil, numberOfFractionDigits: Int? = nil) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        numberFormatter.currencyCode = currencyCode ?? Locale.current.currencyCode ?? "USD"
        numberFormatter.minimumFractionDigits = numberOfFractionDigits ?? 0
        numberFormatter.maximumFractionDigits = numberOfFractionDigits ?? 3
        return numberFormatter.string(from: self)
    }
    
    /// Convert NSNumber values to price strings with specified currency symbol and number of fraction digits.
    @available(swift, deprecated: 5.0, obsoleted: 5.1, renamed: "getPriceString(withCurrencySymbol:fixedFractionDigits:)")
    public func getPriceString(withCurrencySymbol currencySymbol: String = "", numberOfFractionDigits: Int? = nil) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        numberFormatter.currencySymbol = currencySymbol
        numberFormatter.minimumFractionDigits = numberOfFractionDigits ?? 0
        numberFormatter.maximumFractionDigits = numberOfFractionDigits ?? 3
        return numberFormatter.string(from: self)
    }
    
}
