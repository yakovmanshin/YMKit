//
//  NSNumber+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

// PRICE STRINGS

extension NSNumber {
    
    /// Convert NSNumber values to price strings in specified locale and with specified number of fraction digits.
    public func getPriceString(in locale: Locale = .current, numberOfFractionDigits: Int? = nil) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale
        numberFormatter.minimumFractionDigits = numberOfFractionDigits ?? 0
        numberFormatter.maximumFractionDigits = numberOfFractionDigits ?? 3
        return numberFormatter.string(from: self)
    }
    
    /// Convert NSNumber values to price strings with specified currency code and number of fraction digits.
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
