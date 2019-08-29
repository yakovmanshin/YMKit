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
    
    /**
     Initialize a `UIColor` value with RGB values.
     - Parameters:
        - redInput: The amount of red; from 0 to 255
        - blueInput: The amount of blue; from 0 to 255
        - greenInput: The amount of green; from 0 to 255
        - alpha: Alpha value for the color; default is 1.0
    */
    public convenience init(
        red redInput: Int,
        green greenInput: Int,
        blue blueInput: Int,
        alpha alphaInput: CGFloat = 1
    ) {
        var red: Int
        var green: Int
        var blue: Int
        var alpha: CGFloat
        
        if redInput < 0 { red = 0 }
        else if redInput > 255 { red = 255 }
        else { red = redInput }
        
        if greenInput < 0 { green = 0 }
        else if greenInput > 255 { green = 255 }
        else { green = greenInput }
        
        if blueInput < 0 { blue = 0 }
        else if blueInput > 255 { blue = 255 }
        else { blue = blueInput }
        
        if alphaInput < 0 { alpha = 0 }
        else if alphaInput > 1 { alpha = 1 }
        else { alpha = alphaInput }
        
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
    public convenience init?(hex: UInt32, alpha: CGFloat = 1) {
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
    
    ///
    /**
     Initialize values of `UIColor` from hexadecimal color codes.
     + The following formats are supported: `ed2c61`, `#aeaeae`, `eee`, and `#123`.
     - parameter hexStringInput: String with hexadecimal color code
    */
    public convenience init?(hexString hexStringInput: String) {
        let regExPattern = "^#{0,1}([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$"
        let regEx = try! NSRegularExpression(pattern: regExPattern, options: [])
        
        guard regEx.matches(in: hexStringInput, options: [], range: NSRange(location: 0, length: hexStringInput.count)).count == 1 else { return nil }
        
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
