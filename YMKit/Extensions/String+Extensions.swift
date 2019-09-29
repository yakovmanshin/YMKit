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
    public func localized(withParameters parameters: CVarArg...) -> String {
        return String(format: self.localized, arguments: parameters)
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
    ///
    /// - Returns: `Bool`. Matching result.
    public func matchesRegularExpression(_ regularExpression: NSRegularExpression) -> Bool {
        return regularExpression.numberOfMatches(in: self, options: [], range: NSRange(location: 0, length: self.count)) == 1
    }
    
    /// Indicates whether the string fully matches (i.e. has exactly one match with) a regular expression initialized with the specified pattern with options.
    ///
    /// - Parameter regularExpressionPattern: *Required.* Regular expression pattern to initialize an `NSRegularExpression` from..
    /// - Parameter options: *Optional.* `NSRegularExpression.Options` to use when initializing an `NSRegularExpression`; default is `[]`.
    ///
    /// - Returns: `Bool?`. Matching result, if regular expression initialized successfully; otherwise, `nil`.
    public func matchesRegularExpression(fromPattern regularExpressionPattern: String, withOptions options: NSRegularExpression.Options = []) -> Bool? {
        do {
            let regularExpression = try NSRegularExpression(pattern: regularExpressionPattern, options: options)
            
            return self.matchesRegularExpression(regularExpression)
        } catch {
            return nil
        }
    }
    
}
