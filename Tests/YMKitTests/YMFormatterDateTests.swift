//
//  YMFormatterDateTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 11/16/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

// MARK: - Core Declaration

final class YMFormatterDateTests: XCTestCase {
    
    // MARK: Properties
    
    private var date: Date!
    private var dateFormatter: DateFormatter!
    
    // MARK: Preparation
    
    override func setUp() {
        let timeZone = TimeZone(identifier: "PST")
        
        date = DateComponents(
            calendar: .current,
            timeZone: timeZone,
            year: 1984,
            month: 1,
            day: 24,
            hour: 9,
            minute: 41,
            second: 55
        ).date
        
        dateFormatter = DateFormatter()
        dateFormatter?.locale = .init(identifier: "en_US")
        dateFormatter?.timeZone = timeZone
    }
    
    override func tearDown() {
        date = nil
        dateFormatter = nil
    }
    
}

// MARK: - Date

extension YMFormatterDateTests {
    
    func testFullDate() {
        let masterDateString = "Tuesday, January 24, 1984"
        
        let dateString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.dateStyle = .full
        }
        
        XCTAssertEqual(dateString, masterDateString)
    }
    
    func testLongDate() {
        let masterDateString = "January 24, 1984"
        
        let dateString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.dateStyle = .long
        }
        
        XCTAssertEqual(dateString, masterDateString)
    }
    
    func testMediumDate() {
        let masterDateString = "Jan 24, 1984"
        
        let dateString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.dateStyle = .medium
        }
        
        XCTAssertEqual(dateString, masterDateString)
    }
    
    func testShortDate() {
        let masterDateString = "1/24/84"
        
        let dateString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.dateStyle = .short
        }
        
        XCTAssertEqual(dateString, masterDateString)
    }
    
}

// MARK: - Time

extension YMFormatterDateTests {
    
    func testFullTime() {
        let masterTimeString = "9:41:55 AM Pacific Standard Time"
        
        let timeString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.timeStyle = .full
        }
        
        XCTAssertEqual(timeString, masterTimeString)
    }
    
    func testLongTime() {
        let masterTimeString = "9:41:55 AM PST"
        
        let timeString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.timeStyle = .long
        }
        
        XCTAssertEqual(timeString, masterTimeString)
    }
    
    func testMediumTime() {
        let masterTimeString = "9:41:55 AM"
        
        let timeString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.timeStyle = .medium
        }
        
        XCTAssertEqual(timeString, masterTimeString)
    }
    
    func testShortTime() {
        let masterTimeString = "9:41 AM"
        
        let timeString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.timeStyle = .short
        }
        
        XCTAssertEqual(timeString, masterTimeString)
    }
    
}

// MARK: - Date and Time

extension YMFormatterDateTests {
    
    func testFullDateTime() {
        let masterDateTimeString = "Tuesday, January 24, 1984 at 9:41:55 AM Pacific Standard Time"
        
        let dateTimeString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .full
        }
        
        XCTAssertEqual(dateTimeString, masterDateTimeString)
    }
    
    func testLongDateTime() {
        let masterDateTimeString = "January 24, 1984 at 9:41:55 AM PST"
        
        let dateTimeString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .long
        }
        
        XCTAssertEqual(dateTimeString, masterDateTimeString)
    }
    
    func testMediumDateTime() {
        let masterDateTimeString: String
        if #available(iOS 11, *) {
            masterDateTimeString = "Jan 24, 1984 at 9:41:55 AM"
        } else {
            masterDateTimeString = "Jan 24, 1984, 9:41:55 AM"
        }
        
        
        let dateTimeString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
        }
        
        XCTAssertEqual(dateTimeString, masterDateTimeString)
    }
    
    func testShortDateTime() {
        let masterDateTimeString = "1/24/84, 9:41 AM"
        
        let dateTimeString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .short
        }
        
        XCTAssertEqual(dateTimeString, masterDateTimeString)
    }
    
    func testMixedDateTime() {
        let masterDateTimeString = "January 24, 1984 at 9:41 AM"
        
        let dateTimeString = YMFormatter.Date(date, dateFormatter: dateFormatter).makeString { dateFormatter in
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .short
        }
        
        XCTAssertEqual(dateTimeString, masterDateTimeString)
    }
    
}
