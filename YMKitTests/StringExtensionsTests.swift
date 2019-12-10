//
//  StringExtensionsTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 10/10/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

// MARK: - String+Extensions Tests Core

final class StringExtensionsTests: XCTestCase { }

// MARK: - Regular Expression Matching

extension StringExtensionsTests {
    
    static let emailAddressPattern = #"^[a-z0-9]{1}([a-z0-9._%+-]*[a-z0-9]{1})?@[a-z0-9]{1}[a-z0-9.-]{0,126}[a-z0-9]{1}\.[a-z]{2,64}$"#
    
    static let emailAddress1 = "john@example.com"
    static let emailAddress2 = "Jack555@Example.Com"
    static let emailAddress3 = "This is my email address."
    
    func testRegularExpressionMatching() {
        let emailAddress1IsValid = Self.emailAddress1.matchesRegularExpression(fromPattern: Self.emailAddressPattern)
        
        XCTAssertTrue(emailAddress1IsValid!)
        
        let emailAddress2IsValid = Self.emailAddress2.matchesRegularExpression(
            fromPattern: Self.emailAddressPattern,
            withOptions: .caseInsensitive
        )
        
        XCTAssertTrue(emailAddress2IsValid!)
        
        let emailAddress3IsValid = Self.emailAddress3.matchesRegularExpression(fromPattern: Self.emailAddressPattern)
        
        XCTAssertFalse(emailAddress3IsValid!)
    }
    
    func testLegacyRegularExpressionMatching() {
        guard let regularExpression = try? NSRegularExpression(
            pattern: Self.emailAddressPattern,
            options: [.caseInsensitive]
        ) else {
            XCTFail("Failed to initialize NSRegularExpression from pattern")
            return
        }
        
        let emailAddress1IsValid = Self.emailAddress1.matchesRegularExpression(regularExpression)
        
        XCTAssertTrue(emailAddress1IsValid)
        
        let emailAddress2IsValid = Self.emailAddress2.matchesRegularExpression(regularExpression)
        
        XCTAssertTrue(emailAddress2IsValid)
        
        let emailAddress3IsValid = Self.emailAddress3.matchesRegularExpression(regularExpression)
        
        XCTAssertFalse(emailAddress3IsValid)
    }
    
}

// MARK: - Comparison Suitability

extension StringExtensionsTests {
    
    static let masterComparisonUnsuitableString = "Thîs ÌS my tëSt 023"
    static let masterComparisonSuitableString = "this is my test 023"
    
    func testComparisonSuitability() {
        let comparisonSuitableString = Self.masterComparisonUnsuitableString.suitableForComparison
        
        XCTAssertEqual(comparisonSuitableString, Self.masterComparisonSuitableString)
    }
    
}
