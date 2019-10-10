//
//  Date+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

// MARK: - Date Components

extension Date {
    
    /// Initialize `Date` values with year, month, and day (as integers).
    public init?(year: Int, month: Int, day: Int) {
        let calendar = Calendar.current
        let dateComponents = DateComponents(
            calendar: calendar,
            year: year,
            month: month,
            day: day
        )
        
        guard let date = calendar.date(from: dateComponents) else { return nil }
        
        self = date
    }
    
    /// Get specified date component from a `Date` value.
    public func getDateComponent(_ componentType: Calendar.Component) -> Int {
        return Calendar.current.component(componentType, from: self)
    }
    
    /// Get an array of specified date component from a `Date` value.
    public func getDateComponents(_ componentsSet: Set<Calendar.Component>) -> DateComponents {
        return Calendar.current.dateComponents(componentsSet, from: self)
    }
    
    /// Get an array of specified date component from a `Date` value.
    public func getDateComponents(_ components: [Calendar.Component]) -> DateComponents {
        return self.getDateComponents(Set(components))
    }
    
}

// MARK: - Date Formatters

extension Date {
    
    // MARK: Custom Format
    
    /// Initialize a `Date` value from a strings in the specified format.
    public init?(string dateTimeString: String, format formatString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = formatString
        guard let date = dateFormatter.date(from: dateTimeString) else { return nil }
        self = date
    }
    
    /// Convert the `Date` value to a string in the specified format.
    public func getDateTimeString(withFormat formatString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = formatString
        return dateFormatter.string(from: self)
    }
    
    // MARK: YYYY-MM-DD String
    
    /// Initialize a `Date` value from a year-month-day `String`, formatted as`yyyy-MM-dd` (e.g. `1984-01-24`).
    /// - Parameter ymdString: Date formatted as `yyyy-MM-dd`.
    public init?(ymdString: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = dateFormatter.date(from: ymdString) else { return nil }
        
        self = date
    }
    
    /// Convert the `Date` value to a `String` formatted as `yyyy-MM-dd` (e.g. `1984-01-24`).
    public var ymdString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    // MARK: RFC 3339 String
    
    /**
     Initialize dates from RFC 3339-compliant strings.
     + RFC 3339 strings have the following format: `yyyy-MM-dd'T'HH:mm:ss.SSSZ` (e.g. `1984-01-24T09:41:55.123-0800`).
     + They can have or not have a colon in time zone.
     - Parameters:
        - rfc3339String: An RFC 3339-compliant string
        - colonInTimeZone: Set to `true` to accept colons in time zone
    */
    public init?(
        fromRFC3339String rfc3339String: String,
        withColonInTimeZone colonInTimeZone: Bool
    ) {
        self.init(string: rfc3339String, format: colonInTimeZone ? "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ" : "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }
    
    /**
     Convert dates to RFC 3339-compliant strings.
     + RFC 3339 strings have the following format: `yyyy-MM-dd'T'HH:mm:ss.SSSZ` (e.g. `1984-01-24T09:41:55.123-0800`).
     + They can have or not have a colon in time zone.
     - Parameters:
        - colonInTimeZone: Set to `true` to add colon in time zone
     */
    public func getRFC3339String(withColonInTimeZone colonInTimeZone: Bool) -> String {
        return self.getDateTimeString(withFormat: colonInTimeZone ? "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ" : "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }
    
    // MARK: ISO8601 String
    
    @available(iOS, introduced: 10)
    public init?(
        fromISO8601String iso8601String: String,
        formatOptions: ISO8601DateFormatter.Options = []
    ) {
        let iso8601DateFormatter = ISO8601DateFormatter()
        if !formatOptions.isEmpty { iso8601DateFormatter.formatOptions = formatOptions }
        guard let date = iso8601DateFormatter.date(from: iso8601String) else { return nil }
        self = date
    }
    
    @available(iOS, introduced: 10)
    public var iso8601String: String {
        return self.getISO8601String()
    }
    
    @available(iOS, introduced: 10)
    public func getISO8601String(formatOptions: ISO8601DateFormatter.Options = []) -> String {
        let iso8601DateFormatter = ISO8601DateFormatter()
        if !formatOptions.isEmpty { iso8601DateFormatter.formatOptions = formatOptions }
        return iso8601DateFormatter.string(from: self)
    }
    
}

// MARK: - Date and Time Strings

extension Date {
    
    /**
     Convert dates to date and time strings in selected locale and with selected date and time style.
     - Parameters:
        - locale: see `Locale`
        - dateStyle: see `DateFormatter.Style`
        - timeStyle: see `DateFormatter.Style`
    */
    public func getDateTimeString(
        in locale: Locale = Locale.current,
        dateStyle: DateFormatter.Style = .long,
        timeStyle: DateFormatter.Style = .short
    ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.dateStyle = dateStyle
        dateFormatter.timeStyle = timeStyle
        return dateFormatter.string(from: self)
    }
    
    /// Convert dates to date strings with selected date style.
    public func getDateString(withStyle style: DateFormatter.Style = .long) -> String {
        return self.getDateTimeString(dateStyle: style, timeStyle: .none)
    }
    
    /// Convert dates to time strings with selected time style.
    public func getTimeString(withStyle style: DateFormatter.Style = .short) -> String {
        return self.getDateTimeString(dateStyle: .none, timeStyle: style)
    }
    
}
    
// MARK: - Age Calculation

extension Date {
    
    /// Calculate the difference between the date and now.
    public func getDifference(in unitsSet: Set<Calendar.Component>) -> DateComponents {
        return Calendar.current.dateComponents(unitsSet, from: self, to: Date())
    }
    
    /// Calculate the difference between the date and now.
    public func getDifference(in units: [Calendar.Component]) -> DateComponents {
        return self.getDifference(in: Set(units))
    }
    
    /// Calculate the difference between the date and now (in specified units).
    public func getDifference(in unit: Calendar.Component) -> Int? {
        let difference = self.getDifference(in: [unit])
        
        switch unit {
        case .year:
            return difference.year
        case .month:
            return difference.month
        case .day:
            return difference.day
        case .hour:
            return difference.hour
        case .minute:
            return difference.minute
        case .second:
            return difference.second
        case .nanosecond:
            return difference.nanosecond
        default:
            return nil
        }
    }
    
    /// Calculate the difference between the date and now (in years).
    public var ageInYears: Int? {
        return self.getDifference(in: .year)
    }
    
}
