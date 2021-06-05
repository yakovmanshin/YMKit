//
//  HTTPStatusCodeTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 5/30/21.
//  Copyright © 2021 Yakov Manshin. All rights reserved.
//

import XCTest

@testable import YMKitNetworking

final class HTTPStatusCodeTests: XCTestCase {
    
    func testValidCodes() {
        let statusCode100: HTTPStatusCode = 100
        let statusCode200: HTTPStatusCode = 200
        let statusCode599: HTTPStatusCode = 599
        
        XCTAssertTrue(statusCode100.isStatusCode)
        XCTAssertTrue(statusCode200.isStatusCode)
        XCTAssertTrue(statusCode599.isStatusCode)
    }
    
    func testInvalidCodes() {
        let statusCode0: HTTPStatusCode = 0
        let statusCodeNegative1: HTTPStatusCode = -1
        let statusCode600: HTTPStatusCode = 600
        
        XCTAssertFalse(statusCode0.isStatusCode)
        XCTAssertFalse(statusCodeNegative1.isStatusCode)
        XCTAssertFalse(statusCode600.isStatusCode)
    }
    
    func testSuccessCodes() {
        let statusCode200: HTTPStatusCode = 200
        let statusCode299: HTTPStatusCode = 299
        
        XCTAssertTrue(statusCode200.isSuccess)
        XCTAssertTrue(statusCode299.isSuccess)
    }
    
    func testFailureCodes() {
        let statusCode300: HTTPStatusCode = 300
        let statusCodeNegative200: HTTPStatusCode = -200
        
        XCTAssertFalse(statusCode300.isSuccess)
        XCTAssertFalse(statusCodeNegative200.isSuccess)
    }
    
}
