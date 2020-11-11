//
//  YMSafeSubscriptableTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 10/10/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

final class YMSafeSubscriptableTests: XCTestCase {
    
    private let testArray = ["un", "deux", "trois"]
    
    func testExistingElement() {
        let arrayElement = testArray[safe: 1]
        
        let masterArrayElement = "deux"
        
        XCTAssertEqual(arrayElement, masterArrayElement)
    }
    
    func testNonExistentElement() {
        let arrayElement = testArray[safe: 5]
        
        XCTAssertNil(arrayElement)
    }
    
}
