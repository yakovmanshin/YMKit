//
//  NSNumber+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

// MARK: - Price Strings

extension NSNumber {
    
    /// Convert `NSNumber` values to price strings. You can optionally specify minimum and maximum numbers of fraction digits, locale, currency code, and currency symbol.
    public func getBasicPriceString(
        minFractionDigits: Int = 0,
        maxFractionDigits: Int = 3,
        locale: Locale = .current,
        currencyCode: String? = nil,
        currencySymbol: String? = nil
    ) -> String? {
        return YMFormatter.getPriceString(
            from: self,
            minFractionDigits: minFractionDigits,
            maxFractionDigits: maxFractionDigits,
            locale: locale,
            currencyCode: currencyCode,
            currencySymbol: currencySymbol
        )
    }
    
    /// Convert `NSNumber` values to price strings with the specified number of fraction digits. You can optionally specify locale, currency code, and currency symbol.
    public func getPriceStringWithFixedFractionDigits(
        numberOfFractionDigits: Int,
        locale: Locale = .current,
        currencyCode: String? = nil,
        currencySymbol: String? = nil
    ) -> String? {
        return YMFormatter.getPriceString(
            from: self,
            fixedFractionDigits: numberOfFractionDigits,
            locale: locale,
            currencyCode: currencyCode,
            currencySymbol: currencySymbol
        )
    }
    
    /// Convert `NSNumber` values to price strings that use significant digits formatting (see `NumberFormatter.usesSignificantDigits`). You can optionally specify minimum and maximum numbers of significant digits, locale, currency code, and currency symbol.
    public func getPriceStringUsingSignificantDigits(
        min: Int? = nil,
        max: Int? = nil,
        locale: Locale = .current,
        currencyCode: String? = nil,
        currencySymbol: String? = nil
    ) -> String? {
        return YMFormatter.getPriceString(
            from: self,
            significantDigits: true,
            minSignificantDigits: min,
            maxSignificantDigits: max,
            locale: locale,
            currencyCode: currencyCode,
            currencySymbol: currencySymbol
        )
    }
    
}
