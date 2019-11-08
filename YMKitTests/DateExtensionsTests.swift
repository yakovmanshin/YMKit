//
//  DateExtensionsTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 11/8/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

final class DateExtensionsTests: XCTestCase {
    
    func testDateComponents() {
        let date = Date(year: 1984, month: 1, day: 24)
        
        let masterYear = 1984
        let masterMonth = 1
        let masterDay = 24
        
        let year = date?.getDateComponent(.year)
        let month = date?.getDateComponent(.month)
        let day = date?.getDateComponent(.day)
        
        XCTAssertEqual(year, masterYear)
        XCTAssertEqual(month, masterMonth)
        XCTAssertEqual(day, masterDay)
    }
    
    func testYMDString() {
        let masterYMDString = "1984-01-24"
        
        let date = Date(ymdString: masterYMDString)
        
        let ymdString = date?.ymdString
        
        XCTAssertEqual(ymdString, masterYMDString)
    }
    
