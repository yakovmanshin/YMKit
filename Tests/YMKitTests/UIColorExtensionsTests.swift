//
//  UIColorExtensionsTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 12/3/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

// MARK: - UIColor+Extensions Tests Core

final class UIColorExtensionsTests: XCTestCase { }

// MARK: - RGB Components

extension UIColorExtensionsTests {
    
    // MARK: Helper Constants
    
    private enum RGBComponentsHelpers {
        
        static let masterUnspecifiedAlpha: CGFloat = 1
        
        enum Full {
            
            static let masterRed: CGFloat = 0xab / 255
            static let masterGreen: CGFloat = 0xcd / 255
            static let masterBlue: CGFloat = 0xef / 255
            
            static let masterAlpha: CGFloat = 0.5
            
            static let masterHEX: UInt32 = 0xabcdef
            static let masterHEXString = "#abcdef"
            
        }
        
        enum Short {
            
            static let masterRed: CGFloat = 0xaa / 255
            static let masterGreen: CGFloat = 0xbb / 255
            static let masterBlue: CGFloat = 0xcc / 255
            
            static let masterShortHEXString = "abc"
            
        }
        
        enum Invalid {
            
            static let masterInvalidHEXString = "#abcxyz"
            
        }
        
    }
    
    // MARK: RGB Components
    
    func testRGBComponents() {
        let color = UIColor(
            red: RGBComponentsHelpers.Full.masterRed,
            green: RGBComponentsHelpers.Full.masterGreen,
            blue: RGBComponentsHelpers.Full.masterBlue,
            alpha: RGBComponentsHelpers.Full.masterAlpha
        )
        
        let redComponent = color.getRGBComponent(.red)
        let greenComponent = color.getRGBComponent(.green)
        let blueComponent = color.getRGBComponent(.blue)
        let alphaComponent = color.getRGBComponent(.alpha)
        
        XCTAssertEqual(redComponent, RGBComponentsHelpers.Full.masterRed)
        XCTAssertEqual(greenComponent, RGBComponentsHelpers.Full.masterGreen)
        XCTAssertEqual(blueComponent, RGBComponentsHelpers.Full.masterBlue)
        XCTAssertEqual(alphaComponent, RGBComponentsHelpers.Full.masterAlpha)
    }
    
    // MARK: Full HEX
    
    func testHEX() {
        let color = UIColor(hex: RGBComponentsHelpers.Full.masterHEX)
        
        let redComponent = color.getRGBComponent(.red)
        let greenComponent = color.getRGBComponent(.green)
        let blueComponent = color.getRGBComponent(.blue)
        let alphaComponent = color.getRGBComponent(.alpha)
        
        XCTAssertEqual(redComponent, RGBComponentsHelpers.Full.masterRed)
        XCTAssertEqual(greenComponent, RGBComponentsHelpers.Full.masterGreen)
        XCTAssertEqual(blueComponent, RGBComponentsHelpers.Full.masterBlue)
        XCTAssertEqual(alphaComponent, RGBComponentsHelpers.masterUnspecifiedAlpha)
    }
    
    func testHEXString() {
        let color = UIColor(hexString: RGBComponentsHelpers.Full.masterHEXString)
        
        XCTAssertNotNil(color)
        
        let redComponent = color?.getRGBComponent(.red)
        let greenComponent = color?.getRGBComponent(.green)
        let blueComponent = color?.getRGBComponent(.blue)
        let alphaComponent = color?.getRGBComponent(.alpha)
        
        XCTAssertEqual(redComponent, RGBComponentsHelpers.Full.masterRed)
        XCTAssertEqual(greenComponent, RGBComponentsHelpers.Full.masterGreen)
        XCTAssertEqual(blueComponent, RGBComponentsHelpers.Full.masterBlue)
        XCTAssertEqual(alphaComponent, RGBComponentsHelpers.masterUnspecifiedAlpha)
    }
    
    // MARK: Short HEX String
    
    func testShortHEXString() {
        let color = UIColor(hexString: RGBComponentsHelpers.Short.masterShortHEXString)
        
        XCTAssertNotNil(color)
        
        let redComponent = color?.getRGBComponent(.red)
        let greenComponent = color?.getRGBComponent(.green)
        let blueComponent = color?.getRGBComponent(.blue)
        let alphaComponent = color?.getRGBComponent(.alpha)
        
        XCTAssertEqual(redComponent, RGBComponentsHelpers.Short.masterRed)
        XCTAssertEqual(greenComponent, RGBComponentsHelpers.Short.masterGreen)
        XCTAssertEqual(blueComponent, RGBComponentsHelpers.Short.masterBlue)
        XCTAssertEqual(alphaComponent, RGBComponentsHelpers.masterUnspecifiedAlpha)
    }
    
    // MARK: Invalid HEX String
    
    func testInvalidHEXString() {
        let color = UIColor(hexString: RGBComponentsHelpers.Invalid.masterInvalidHEXString)
        
        XCTAssertNil(color)
    }
    
}
