//
//  DataExtensionsTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 12/11/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

final class DataExtensionsTests: XCTestCase { }

// MARK: - Data-to-String and String-to-Data Conversions

extension DataExtensionsTests {
    
    // MARK: Helper Constants
    
    static let masterLoremIpsumString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec luctus felis, ut imperdiet nulla. Sed sagittis ultricies lorem. Vestibulum mollis est sit amet ligula porta suscipit. Nullam nisl justo, commodo et dolor sit amet, blandit dapibus justo. Mauris nisl ante, euismod fermentum fermentum in, consectetur nec felis. Nullam suscipit quis ipsum ut tincidunt. Sed dignissim diam a massa fermentum malesuada. Phasellus malesuada tortor vel tellus posuere, sit amet venenatis felis tempor."
    
    // MARK: UTF-8
    
    func testUTF8StringConversion() {
        let loremIpsumData = Self.masterLoremIpsumString.data(using: .utf8)
        
        let loremIpsumString = loremIpsumData?.utf8String
        
        XCTAssertEqual(loremIpsumString, Self.masterLoremIpsumString)
    }
    
    // MARK: UTF-16
    
    func testUTF16StringConversion() {
        let loremIpsumData = Self.masterLoremIpsumString.data(using: .utf16)
        
        let loremIpsumString = loremIpsumData?.utf16String
        
        XCTAssertEqual(loremIpsumString, Self.masterLoremIpsumString)
    }
    
}
