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
     Convert `NSNumber` values to highly customizable price strings.
     + By default, this methods returns a price string with a grouping separator and the number of fraction digits varying from 0 to 3.
     - Parameters:
        - significantDigits: whether to use “significant digits” (see `NumberFormatter.usesSignificantDigits` for more details)
        - minSignificantDigits: the minimum number of significant digits to display; default is 1
        - maxSignificantDigits: the maximum number of significant digits to display; default is 6
        - fixedFractionDigits: specify to use the exact number of fraction digits; default is `nil`, which means the number of fraction digits will depend on the next two arguments
        - minFractionDigits: the minimum number of fraction digits to display; default is `0`
        - maxFractionDigits: the maximum number of fraction digits to display; default is `3`
        - groupingSeparator: whether to use grouping separator; default is `true`
        - locale: the locale you’d like to use in the price string; defaults to the current locale of the device
        - currencyCode: ISO 4217-compliant currency code (such as “USD” or “EUR”)
        - currencySymbol: a symbol that represents the currency (such as “$” or “€”)
     - Returns: A string that represents the `NSNumber` value with specified style.
    */
    public func getPriceString(significantDigits: Bool = false, minSignificantDigits: Int? = nil, maxSignificantDigits: Int? = nil, fixedFractionDigits: Int? = nil, minFractionDigits: Int = 0, maxFractionDigits: Int = 3, groupingSeparator: Bool = true, locale: Locale = .current, currencyCode: String? = nil, currencySymbol: String? = nil) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.usesGroupingSeparator = groupingSeparator
        
        numberFormatter.locale = locale
        
        if let currencyCode = currencyCode {
            numberFormatter.currencyCode = currencyCode
        }
        
        if let currencySymbol = currencySymbol {
            numberFormatter.currencySymbol = currencySymbol
        }
        
        if significantDigits {
            numberFormatter.usesSignificantDigits = true
            
            if let minSignificantDigits = minSignificantDigits {
                numberFormatter.minimumSignificantDigits = minSignificantDigits
            }
            
            if let maxSignificantDigits = maxSignificantDigits {
                numberFormatter.maximumSignificantDigits = maxSignificantDigits
            }
        } else {
            numberFormatter.usesSignificantDigits = false
            numberFormatter.minimumIntegerDigits = 1
            
            if let fixedFractionDigits = fixedFractionDigits {
                numberFormatter.minimumFractionDigits = fixedFractionDigits
                numberFormatter.maximumFractionDigits = fixedFractionDigits
            } else {
                numberFormatter.minimumFractionDigits = minFractionDigits
                numberFormatter.maximumFractionDigits = maxFractionDigits
            }
        }
        
        return numberFormatter.string(from: self)
    }
    
    /// Convert `NSNumber` values to price strings. You can optionally specify minimum and maximum numbers of fraction digits, locale, currency code, and currency symbol.
    public func getBasicPriceString(minFractionDigits: Int = 0, maxFractionDigits: Int = 3, locale: Locale = .current, currencyCode: String? = nil, currencySymbol: String? = nil) -> String? {
        return getPriceString(minFractionDigits: minFractionDigits, maxFractionDigits: maxFractionDigits, locale: locale, currencyCode: currencyCode, currencySymbol: currencySymbol)
    }
    
    /// Convert `NSNumber` values to price strings with the specified number of fraction digits. You can optionally specify locale, currency code, and currency symbol.
    public func getPriceStringWithFixedFractionDigits(numberOfFractionDigits: Int, locale: Locale = .current, currencyCode: String? = nil, currencySymbol: String? = nil) -> String? {
        return getPriceString(fixedFractionDigits: numberOfFractionDigits, locale: locale, currencyCode: currencyCode, currencySymbol: currencySymbol)
    }
    
    /// Convert `NSNumber` values to price strings that use significant digits formatting (see `NumberFormatter.usesSignificantDigits`). You can optionally specify minimum and maximum numbers of significant digits, locale, currency code, and currency symbol.
    public func getPriceStringUsingSignificantDigits(min: Int? = nil, max: Int? = nil, locale: Locale = .current, currencyCode: String? = nil, currencySymbol: String? = nil) -> String? {
        return getPriceString(significantDigits: true, minSignificantDigits: min, maxSignificantDigits: max, locale: locale, currencyCode: currencyCode, currencySymbol: currencySymbol)
    }
    
}
