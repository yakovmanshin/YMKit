//
//  Double+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/13/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

// PRICE STRINGS

extension Double {
    
    /// Convert Double values to price strings in specified locale and with specified number of fraction digits.
    public func getPriceString(in locale: Locale = .current, numberOfFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(in: locale, numberOfFractionDigits: numberOfFractionDigits)
    }
    
    /// Convert Double values to price strings with specified currency code and number of fraction digits.
    public func getPriceString(currencyCode: String? = nil, numberOfFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(currencyCode: currencyCode, numberOfFractionDigits: numberOfFractionDigits)
    }
    
    /// Convert Double values to price strings with specified currency symbol and number of fraction digits.
    public func getPriceString(withCurrencySymbol currencySymbol: String = "", numberOfFractionDigits: Int? = nil) -> String? {
        return NSNumber(value: self).getPriceString(withCurrencySymbol: currencySymbol, numberOfFractionDigits: numberOfFractionDigits)
    }
    
}
