//
//  YMFormatter.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/14/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

/// A collection of methods for formatting different kinds of data, such as names, prices, and more.
public enum YMFormatter { }

// MARK: - Date String

extension YMFormatter {
    
    /// Converts a `Date` to a `String` using the provided `configurationClosure.`
    ///
    /// - Parameters:
    ///   - date: *Required.* The `Date` for convert to a `String`.
    ///   - configurationClosure: *Optional.* The block of code that contains a custom configuration of `DateFormatter`. The default value does nothing.
    ///   - dateFormatter: The `DateFormatter` provided to caller to configure.
    public static func getDateString(
        from date: Date,
        configurationClosure: (_ dateFormatter: DateFormatter) -> Void = { _ in }
    ) -> String {
        let dateFormatter = DateFormatter()
        
        configurationClosure(dateFormatter)
        
        return dateFormatter.string(from: date)
    }
    
}

// MARK: - Person Name String

@available(iOS, introduced: 9)
extension YMFormatter {
    
    /// Compose person name components into a single string with the specified style.
    ///
    /// + Even though all parameters have default values, you should provide at least one name component; otherwise, an empty string will be returned.
    ///
    /// - Parameter style: *Optional.* See `PersonNameComponentsFormatter.Style`.
    /// - Parameter prefix: *Optional.* Dr., Mr., Ms., etc.
    /// - Parameter firstName: *Optional.* Johnatan
    /// - Parameter middleName: *Optional.* Maple
    /// - Parameter nickname: *Optional.* Johnny
    /// - Parameter lastName: *Optional.* Appleseed
    /// - Parameter suffix: *Optional.* Esq., Jr., Ph.D., etc.
    public static func getPersonNameString(
        withStyle style: PersonNameComponentsFormatter.Style = .default,
        prefix: String? = nil,
        firstName: String? = nil,
        middleName: String? = nil,
        nickname: String? = nil,
        lastName: String? = nil,
        suffix: String? = nil
    ) -> String {
        let nameFormatter = PersonNameComponentsFormatter()
        nameFormatter.style = style
        
        var nameComponents = PersonNameComponents()
        nameComponents.namePrefix = prefix
        nameComponents.givenName = firstName
        nameComponents.middleName = middleName
        nameComponents.nickname = nickname
        nameComponents.familyName = lastName
        nameComponents.nameSuffix = suffix
        
        return nameFormatter.string(from: nameComponents)
    }
    
    /// Compose a person's first name and last name into a single string with the specified style.
    ///
    /// + Although both `firstName` and `lastName` are optional, specify at least one of arguments; otherwise, an empty string will be returned.
    ///
    /// - Parameter style: *Optional.* See `PersonNameComponentsFormatter.Style`.
    /// - Parameter firstName: *Optional.* Johnatan
    /// - Parameter lastName: *Optional.* Appleseed
    public static func getPersonNameString(
        withStyle style: PersonNameComponentsFormatter.Style = .default,
        firstName: String? = nil,
        lastName: String? = nil
    ) -> String {
        return getPersonNameString(
            withStyle: style,
            prefix: nil,
            firstName: firstName,
            middleName: nil,
            nickname: nil,
            lastName: lastName,
            suffix: nil
        )
    }
    
}

// MARK: - Price String

extension YMFormatter {
    
    /// Converts `NSNumber` values to highly customizable price strings.
    ///
    /// + By default, this methods returns a price string with the locale-specified grouping separator and the number of fraction digits varying from 0 to 3, depending on the value.
    ///
    /// - Parameter inputValue: *Required.* The value to convert to a price string.
    /// - Parameter significantDigits: *Optional.* Specifies whether to use "significant digits" (see `NumberFormatter.usesSignificantDigits` for details); default is `false`.
    /// - Parameter minSignificantDigits: *Optional.* The minimum number of significant digits to display; default is `nil`; if not set, uses `NumberFormatter`'s default value (`1`).
    /// - Parameter maxSignificantDigits: *Optional.* The maximum number of significant digits to display; default is `nil`; if not set, uses `NumberFormatter`'s default value (`6`).
    /// - Parameter fixedFractionDigits: *Optional.* Specifies whether to use the exact number of fraction digits; default is `nil`, which means the number of fraction digits will depend on values specified in `minFractionDigits` and `maxFractionDigits`.
    /// - Parameter minFractionDigits: *Optional.* The minimum number of fraction digits to display; default is `0`.
    /// - Parameter maxFractionDigits: *Optional.* The maximum number of fraction digits to display; default is `3`.
    /// - Parameter groupingSeparatorIsEnabled: *Optional.* Specifies whether to use a locale-specified grouping separator; default is `true`.
    /// - Parameter locale: *Optional.* The locale to use in the price string; default is `.current`.
    /// - Parameter currencyCode: *Optional.* An ISO 4217-compliant currency code (such as "USD" or "EUR").
    /// - Parameter currencySymbol: *Optional.* A symbol that represents the currency (such as "$" or "€").
    ///
    /// - Returns: A string that represents the original `NSNumber` value with the specified style applied.
    public static func getPriceString(
        from inputValue: NSNumber,
        significantDigits: Bool = false,
        minSignificantDigits: Int? = nil,
        maxSignificantDigits: Int? = nil,
        fixedFractionDigits: Int? = nil,
        minFractionDigits: Int = 0,
        maxFractionDigits: Int = 3,
        groupingSeparatorIsEnabled: Bool = true,
        locale: Locale = .current,
        currencyCode: String? = nil,
        currencySymbol: String? = nil
    ) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.usesGroupingSeparator = groupingSeparatorIsEnabled
        
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
        
        return numberFormatter.string(from: inputValue)
    }
    
}
