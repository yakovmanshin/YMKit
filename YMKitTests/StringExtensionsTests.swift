//
//  StringExtensionsTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 10/10/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

final class StringExtensionsTests: XCTestCase {
    
    func testRegularExpressionMatching() {
        let emailAddressPattern = #"^[a-z0-9]{1}([a-z0-9._%+-]*[a-z0-9]{1})?@[a-z0-9]{1}[a-z0-9.-]{0,126}[a-z0-9]{1}\.[a-z]{2,64}$"#
        
        let emailAddress1 = "john@example.com"
        let isEmailAddress1Valid = emailAddress1.matchesRegularExpression(fromPattern: emailAddressPattern)
        XCTAssertNotNil(isEmailAddress1Valid)
        XCTAssertTrue(isEmailAddress1Valid!)
        
        let emailAddress2 = "Jack555@Example.Com"
        let isEmailAddress2Valid = emailAddress2.matchesRegularExpression(
            fromPattern: emailAddressPattern,
            withOptions: .caseInsensitive
        )
        XCTAssertNotNil(isEmailAddress2Valid)
        XCTAssertTrue(isEmailAddress2Valid!)
        
        let emailAddress3 = "This is my email address."
        let isEmailAddress3Valid = emailAddress3.matchesRegularExpression(fromPattern: emailAddressPattern)
        XCTAssertNotNil(isEmailAddress3Valid)
        XCTAssertFalse(isEmailAddress3Valid!)
    }
    
}
