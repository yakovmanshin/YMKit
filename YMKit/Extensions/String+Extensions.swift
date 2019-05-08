//
//  String+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

// MARK: - LOCALIZATION

extension String {
    
    /// Substitute the specified key with the corresponding localized string.
    @inline(__always)
    public var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    /**
     Substitute the specified key with the corresponding localized string, substituting additional parameters.
     + The number and types of parameters in function call must match the number and types of parameters in the localized string, or a runtime error will occur.
    */
    @inline(__always)
    public func localized(withParameters parameters: CVarArg...) -> String {
        return String(format: self.localized, arguments: parameters)
    }
    
}

// MARK: - TRANSFORMATION

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

// MARK: - COMPARISON

extension String {
    
    /**
     Creates a string suitable for comparison by removing insignificant distinctions from the string.
     + To specify more options, call `folding(options:locale:)` on the string instead.
     + For the full list of options, see `NSString.CompareOptions`.
     - Returns: A string created by calling `folding(options:locale:)` with options `caseInsensitive`, `diacriticInsensitive`, and `numeric` on the string.
    */
    @inline(__always)
    public var suitableForComparison: String {
        return self.folding(options: [.caseInsensitive, .diacriticInsensitive, .numeric], locale: .current)
    }
    
}
