//
//  UIColor+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/12/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import UIKit

// MARK: - RGB

extension UIColor {
    
    @inline(__always)
    private static func resolveColorValue(_ inputValue: Int) -> UInt8 {
        switch inputValue {
        case ..<0:
            return 0
        case 0...255:
            return UInt8(inputValue)
        default:
            return 255
        }
    }
    
    /// Initializes a `UIColor` with RGB values and optional alpha.
    ///
    /// - Parameter redInput: *Required.* The amount of red; from 0 to 255
    /// - Parameter greenInput: *Required.* The amount of green; from 0 to 255
    /// - Parameter blueInput: *Required.* The amount of blue; from 0 to 255
    /// - Parameter alphaInput: *Optional.* The alpha value; from 0 to 1; default is 1.
    public convenience init(
        red redInput: Int,
        green greenInput: Int,
        blue blueInput: Int,
        alpha alphaInput: CGFloat = 1
    ) {
        let red = UIColor.resolveColorValue(redInput)
        let green = UIColor.resolveColorValue(greenInput)
        let blue = UIColor.resolveColorValue(blueInput)
        
        let alpha: CGFloat
        switch alphaInput {
        case ..<0: alpha = 0
        case 0...1: alpha = alphaInput
        default: alpha = 1
        }
        
        self.init(
            red: CGFloat(red) / 255,
            green: CGFloat(green) / 255,
            blue: CGFloat(blue) / 255,
            alpha: alpha
        )
    }
    
}

// MARK: - HEX

extension UIColor {
    
    /**
     Initialize values of `UIColor` from hexadecimal numbers (e.g. `0xED2C61`).
     + Three-digit numbers (e.g. `0xFFF`) aren’t supported in this version. Use `init(hexString:)`.
     - Parameters:
        - hex: Hexadecimal color number (from `0x000000` to `0xFFFFFF`)
        - alpha: Alpha value for the color; default is 1.0
    */
    public convenience init(hex: UInt32, alpha: CGFloat = 1) {
        let red = (hex >> 16) & 0xFF
        let green = (hex >> 8) & 0xFF
        let blue = hex & 0xFF
        
        self.init(
            red: Int(red),
            green: Int(green),
            blue: Int(blue),
            alpha: alpha
        )
    }
    
    /// Initializes a `UIColor` from a hexadecimal color code.
    ///
    /// + The following formats are supported: `ed2c61`, `#aeaeae`, `eee`, and `#123`.
    ///
    /// - Parameter hexStringInput: *Required.* The string which contains a hexadecimal color code.
    public convenience init?(hexString hexStringInput: String) {
        let regExPattern = "^#{0,1}([0-9a-f]{3}|[0-9a-f]{6})$"
        guard let regEx = try? NSRegularExpression(
            pattern: regExPattern,
            options: [.caseInsensitive]
        ) else { return nil }
        
        guard regEx.matches(
            in: hexStringInput,
            options: [],
            range: NSRange(
                location: 0,
                length: hexStringInput.count
            )
        ).count == 1 else { return nil }
        
        var hexString = hexStringInput
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count == 3 {
            let r = hexString[..<hexString.index(hexString.startIndex, offsetBy: 1)]
            let g = hexString[hexString.index(hexString.startIndex, offsetBy: 1)..<hexString.index(hexString.startIndex, offsetBy: 2)]
            let b = hexString[hexString.index(hexString.startIndex, offsetBy: 2)...]
            
            hexString = [r, r, g, g, b, b].map({ String($0) }).joined()
        }
        
        var hex: UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&hex)
        
        self.init(hex: hex)
    }
    
}
