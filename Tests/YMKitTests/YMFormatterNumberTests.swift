//
//  YMFormatterNumberTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 11/16/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMFormatter
@testable import YMKit

// MARK: - Core Declaration

final class YMFormatterNumberTests: XCTestCase {
    
    // MARK: Properties
    
    private var number: NSNumber!
    private var numberFormatter: NumberFormatter!
    
    // MARK: Preparation
    
    override func setUp() {
        number = .init(floatLiteral: 1234.5678)
        
        numberFormatter = NumberFormatter()
        numberFormatter.locale = .init(identifier: "en_US")
    }
    
    override func tearDown() {
        number = nil
        numberFormatter = nil
    }
    
}

extension YMFormatterNumberTests {
    
    // MARK: - Number
    
    func testDefaultNumberString() {
        let masterNumberString = "1235"
        
        let numberString = YMFormatter.Number(number, numberFormatter: numberFormatter).makeString(using: { _ in })
        
        XCTAssertEqual(numberString, masterNumberString)
    }
    
    func testDecimalNumberString() {
        let masterNumberString = "1,234.568"
        
        let numberString = YMFormatter.Number(number, numberFormatter: numberFormatter).makeString { numberFormatter in
            numberFormatter.numberStyle = .decimal
        }
        
        XCTAssertEqual(numberString, masterNumberString)
    }
    
    func testManualFractionDigitsNumberString() {
        let masterNumberString = "1234.5678"
        
        let numberString = YMFormatter.Number(number, numberFormatter: numberFormatter).makeString { numberFormatter in
            numberFormatter.minimumFractionDigits = 0
            numberFormatter.maximumFractionDigits = 5
        }
        
        XCTAssertEqual(numberString, masterNumberString)
    }
    
    func testSpellOutNumberString() {
        let masterNumberString = "one thousand two hundred thirty-four point five six seven eight"
        
        let numberString = YMFormatter.Number(number, numberFormatter: numberFormatter).makeString { numberFormatter in
            numberFormatter.numberStyle = .spellOut
        }
        
        XCTAssertEqual(numberString, masterNumberString)
    }
    
}

// MARK: - Currency

extension YMFormatterNumberTests {
    
    func testDefaultCurrencyString() {
        let masterCurrencyString = "$1,234.57"
        
        let currencyString = YMFormatter.Number(number, numberFormatter: numberFormatter).makeString { numberFormatter in
            numberFormatter.numberStyle = .currency
        }
        
        XCTAssertEqual(currencyString, masterCurrencyString)
    }
    
    // This test is temporarily disabled because of incompatibility with iOS 11 and iOS 10.
//    func testForeignCurrencyString() {
//        let masterCurrencyString = "1 234,57 €"
//
//        let currencyString = YMFormatter.Number(number, numberFormatter: numberFormatter).makeString { numberFormatter in
//            numberFormatter.numberStyle = .currency
//
//            numberFormatter.locale = .init(identifier: "fr_FR")
//        }
//
//        XCTAssertEqual(currencyString, masterCurrencyString)
//    }
    
    func testManualFractionDigitsCurrencyString() {
        let masterCurrencyString = "$1,234.6"
        
        let currencyString = YMFormatter.Number(number, numberFormatter: numberFormatter).makeString { numberFormatter in
            numberFormatter.numberStyle = .currency
            
            numberFormatter.maximumFractionDigits = 1
        }
        
        XCTAssertEqual(currencyString, masterCurrencyString)
    }
    
}
