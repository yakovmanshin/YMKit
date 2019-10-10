//
//  IntExtensionsTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 10/10/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

final class IntExtensionsTests: XCTestCase {
    
    func testHTTPCode200() {
        let statusCode = 200
        
        let isHTTPSuccess = statusCode.isHTTPSuccess
        
        XCTAssertTrue(isHTTPSuccess)
    }
    
    func testHTTPCode404() {
        let statusCode = 404
        
        let isHTTPSuccess = statusCode.isHTTPSuccess
        
        XCTAssertFalse(isHTTPSuccess)
    }
    
}
