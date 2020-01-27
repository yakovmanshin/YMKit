//
//  String+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import Foundation

// MARK: - Localization

extension String {
    
    /// Substitute the specified key with the corresponding localized string.
    @inlinable
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    /**
     Substitute the specified key with the corresponding localized string, substituting additional parameters.
     + The number and types of parameters in function call must match the number and types of parameters in the localized string, or a runtime error will occur.
    */
    @inlinable
    public func localized(withParameters parameters: CVarArg...) -> String {
        return String(format: self.localized, arguments: parameters)
    }
    
    /// Produces a localized string by interpolating `parameters` in the localizable string template accessed by the key (`self`).
    ///
    /// + Make sure the number and value types of `parameters` match the localizable string template. Otherwise, a runtime error will occur.
    ///
    /// - Parameter parameters: *Required.* The parameters to interpolate.
    /// - Parameter locale: *Optional.* A `Locale` object specifying the locale to use. To use the current locale (specified by user preferences), pass `.current`. To use the system locale, pass `nil`.
    ///
    /// - Important: This method contains a bug that cannot be fixed in a backward-compatible manner. Upgrade to YMKit v3.x.x as soon as possible.
    /// If you cannot upgrade and absolutely have to use this method, don't omit the second argument in call: i.e. instead
    /// of `localized(withParameters: ["John", "Smith"])`, use `localized(withParameters: ["John", "Smith"], in: nil)`.
    @available(*, deprecated, message: "This method contains a bug. See documentation for details.")
    @inlinable
    public func localized(
        withParameters parameters: [CVarArg],
        in locale: Locale? = nil
    ) -> String {
        return String(
            format: self.localized,
            locale: locale,
            arguments: parameters
        )
    }
    
    /// Produces a localized string by interpolating `parameter` in the localizable string template accessed by the key (`self`).
    ///
    /// + Make sure the value type of `parameter` matches the localizable string template. Otherwise, a runtime error will occur.
    ///
    /// - Parameter parameter: *Required.* The parameter to interpolate.
    /// - Parameter locale: *Optional.* A `Locale` object specifying the locale to use. To use the current locale (specified by user preferences), pass `.current`. To use the system locale, pass `nil`.
    @inlinable
    public func localized(
        withParameter parameter: CVarArg,
        in locale: Locale? = nil
    ) -> String {
        return self.localized(withParameters: [parameter], in: locale)
    }
    
}

// MARK: - Transformation

extension String {
    
    /**
     Returns a new string by applying a sequence of transforms to the string.
     + Transforms are applied in the order they’re specified in.
     + For the list of available transforms, see `StringTransform`.
    */
    @available(iOS 9, *)
    public func applyingTransformChain(_ transformChain: [StringTransform]) -> String? {
        var transformedString: String? = self
        
        for transform in transformChain {
            transformedString = transformedString?.applyingTransform(transform, reverse: false)
        }
        
        return transformedString
    }
    
}

// MARK: - Comparison

extension String {
    
    /**
     Creates a string suitable for comparison by removing insignificant distinctions from the string.
     + To specify more options, call `folding(options:locale:)` on the string instead.
     + For the full list of options, see `NSString.CompareOptions`.
     - Returns: A string created by calling `folding(options:locale:)` with options `caseInsensitive`, `diacriticInsensitive`, and `numeric` on the string.
    */
    public var suitableForComparison: String {
        return self.folding(options: [.caseInsensitive, .diacriticInsensitive, .numeric], locale: .current)
    }
    
}

// MARK: - Matching Against Regular Expressions

extension String {
    
    /// Indicates whether the string fully matches (i.e. has exactly one match with) the specified regular expression.
    ///
    /// - Parameter regularExpression: *Required.* Regular expression to match the string against.
    /// - Parameter matchingOptions: *Optional.* Matching options to use. See `NSRegularExpression.MatchingOptions`. Default is `[]`.
    ///
    /// - Returns: `Bool`. Matching result.
    public func matches(
        _ regularExpression: NSRegularExpression,
        withOptions matchingOptions: NSRegularExpression.MatchingOptions = []
    ) -> Bool {
        return regularExpression.numberOfMatches(
            in: self,
            options: matchingOptions,
            range: NSRange(location: 0, length: self.count)
        ) == 1
    }
    
    @available(*, deprecated, renamed: "matches(_:)")
    public func matchesRegularExpression(_ regularExpression: NSRegularExpression) -> Bool {
        return self.matches(regularExpression)
    }
    
    /// Indicates whether the string fully matches (i.e. has exactly one match with) a regular expression initialized with the specified pattern with options.
    ///
    /// - Parameter regularExpressionPattern: *Required.* Regular expression pattern to initialize an `NSRegularExpression` from.
    /// - Parameter options: *Optional.* `NSRegularExpression.Options` to use when initializing an `NSRegularExpression`; default is `[]`.
    public func matchesRegularExpressionThrowing(
        fromPattern regularExpressionPattern: String,
        withOptions options: NSRegularExpression.Options = []
    ) throws -> Bool {
        let regularExpression = try NSRegularExpression(
            pattern: regularExpressionPattern,
            options: options
        )
        
        return self.matches(regularExpression)
    }
    
    /// Indicates whether the string fully matches (i.e. has exactly one match with) a regular expression initialized with the specified pattern with options.
    ///
    /// - Parameter regularExpressionPattern: *Required.* Regular expression pattern to initialize an `NSRegularExpression` from.
    /// - Parameter options: *Optional.* `NSRegularExpression.Options` to use when initializing an `NSRegularExpression`; default is `[]`.
    ///
    /// - Returns: `Bool?`. Matching result, if regular expression initialized successfully; otherwise, `nil`.
    public func matchesRegularExpression(
        fromPattern regularExpressionPattern: String,
        withOptions options: NSRegularExpression.Options = []
    ) -> Bool? {
        return try? self.matchesRegularExpressionThrowing(
            fromPattern: regularExpressionPattern,
            withOptions: options
        )
    }
    
}
