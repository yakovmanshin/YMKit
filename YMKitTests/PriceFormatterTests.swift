//
//  PriceFormatterTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 10/10/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

//final class PriceFormatterTests: XCTestCase {
//    
//    let intPrice = 1234
//    let doublePrice = 1234.5678
//    let nsNumberPrice = NSNumber(value: 12340000.0000567890)
//    
//    let usLocale = Locale(identifier: "en_US")
//    let frLocale = Locale(identifier: "fr_FR")
//    let gbLocale = Locale(identifier: "en_GB")
//    
//    // MARK: Int
//    
//    func testBasicIntPriceString() {
//        let usdPriceString = intPrice.getBasicPriceString(
//            currencyCode: usLocale.currencyCode
//        )
//        
//        let eurPriceString = intPrice.getBasicPriceString(
//            locale: frLocale
//        )
//        
//        let gbpPriceString = intPrice.getBasicPriceString(
//            currencySymbol: gbLocale.currencySymbol
//        )
//        
//        let usdMasterPriceString = "$1,234"
//        let eurMasterPriceString = "1 234 €"
//        let gbpMasterPriceString = "£1,234"
//        
//        XCTAssertEqual(usdPriceString, usdMasterPriceString)
//        XCTAssertEqual(eurPriceString, eurMasterPriceString)
//        XCTAssertEqual(gbpPriceString, gbpMasterPriceString)
//    }
//    
//    func testIntPriceStringWithFixedFractionDigits() {
//        let usdPriceString = intPrice.getPriceStringWithFixedFractionDigits(
//            numberOfFractionDigits: 0,
//            currencyCode: usLocale.currencyCode
//        )
//        
//        let eurPriceString = intPrice.getPriceStringWithFixedFractionDigits(
//            numberOfFractionDigits: 2,
//            locale: frLocale
//        )
//        
//        let gbpPriceString = intPrice.getPriceStringWithFixedFractionDigits(
//            numberOfFractionDigits: 4,
//            currencySymbol: gbLocale.currencySymbol
//        )
//        
//        let usdMasterPriceString = "$1,234"
//        let eurMasterPriceString = "1 234,00 €"
//        let gbpMasterPriceString = "£1,234.0000"
//        
//        XCTAssertEqual(usdPriceString, usdMasterPriceString)
//        XCTAssertEqual(eurPriceString, eurMasterPriceString)
//        XCTAssertEqual(gbpPriceString, gbpMasterPriceString)
//    }
//    
//    func testIntPriceStringUsingSignificantDigits() {
//        let usdPriceString = intPrice.getPriceStringUsingSignificantDigits(
//            currencyCode: usLocale.currencyCode
//        )
//        
//        let eurPriceString = intPrice.getPriceStringUsingSignificantDigits(
//            min: 5,
//            max: 8,
//            locale: frLocale
//        )
//        
//        let gbpPriceString = intPrice.getPriceStringUsingSignificantDigits(
//            min: 1,
//            max: 2,
//            currencySymbol: gbLocale.currencySymbol
//        )
//        
//        let usdMasterPriceString = "$1,234"
//        let eurMasterPriceString = "1 234,0 €"
//        let gbpMasterPriceString = "£1,200"
//        
//        XCTAssertEqual(usdPriceString, usdMasterPriceString)
//        XCTAssertEqual(eurPriceString, eurMasterPriceString)
//        XCTAssertEqual(gbpPriceString, gbpMasterPriceString)
//    }
//    
//    // MARK: Double
//    
//    func testBasicDoublePriceString() {
//        let usdPriceString = doublePrice.getBasicPriceString(
//            currencyCode: usLocale.currencyCode
//        )
//        
//        let eurPriceString = doublePrice.getBasicPriceString(
//            locale: frLocale
//        )
//        
//        let gbpPriceString = doublePrice.getBasicPriceString(
//            currencySymbol: gbLocale.currencySymbol
//        )
//        
//        let usdMasterPriceString = "$1,234.568"
//        let eurMasterPriceString = "1 234,568 €"
//        let gbpMasterPriceString = "£1,234.568"
//        
//        XCTAssertEqual(usdPriceString, usdMasterPriceString)
//        XCTAssertEqual(eurPriceString, eurMasterPriceString)
//        XCTAssertEqual(gbpPriceString, gbpMasterPriceString)
//    }
//    
//    func testDoublePriceStringWithFixedFractionDigits() {
//        let usdPriceString = doublePrice.getPriceStringWithFixedFractionDigits(
//            numberOfFractionDigits: 0,
//            currencyCode: usLocale.currencyCode
//        )
//        
//        let eurPriceString = doublePrice.getPriceStringWithFixedFractionDigits(
//            numberOfFractionDigits: 2,
//            locale: frLocale
//        )
//        
//        let gbpPriceString = doublePrice.getPriceStringWithFixedFractionDigits(
//            numberOfFractionDigits: 4,
//            currencySymbol: gbLocale.currencySymbol
//        )
//        
//        let usdMasterPriceString = "$1,235"
//        let eurMasterPriceString = "1 234,57 €"
//        let gbpMasterPriceString = "£1,234.5678"
//        
//        XCTAssertEqual(usdPriceString, usdMasterPriceString)
//        XCTAssertEqual(eurPriceString, eurMasterPriceString)
//        XCTAssertEqual(gbpPriceString, gbpMasterPriceString)
//    }
//    
//    func testDoublePriceStringUsingSignificantDigits() {
//        let usdPriceString = doublePrice.getPriceStringUsingSignificantDigits(
//            currencyCode: usLocale.currencyCode
//        )
//        
//        let eurPriceString = doublePrice.getPriceStringUsingSignificantDigits(
//            min: 5,
//            max: 8,
//            locale: frLocale
//        )
//        
//        let gbpPriceString = doublePrice.getPriceStringUsingSignificantDigits(
//            min: 1,
//            max: 2,
//            currencySymbol: gbLocale.currencySymbol
//        )
//        
//        let usdMasterPriceString = "$1,234.57"
//        let eurMasterPriceString = "1 234,5678 €"
//        let gbpMasterPriceString = "£1,200"
//        
//        XCTAssertEqual(usdPriceString, usdMasterPriceString)
//        XCTAssertEqual(eurPriceString, eurMasterPriceString)
//        XCTAssertEqual(gbpPriceString, gbpMasterPriceString)
//    }
//    
//    // MARK: NSNumber
//    
//    func testBasicNSNumberPriceString() {
//        let usdPriceString = nsNumberPrice.getBasicPriceString(
//            currencyCode: usLocale.currencyCode
//        )
//        
//        let eurPriceString = nsNumberPrice.getBasicPriceString(
//            locale: frLocale
//        )
//        
//        let gbpPriceString = nsNumberPrice.getBasicPriceString(
//            currencySymbol: gbLocale.currencySymbol
//        )
//        
//        let usdMasterPriceString = "$12,340,000"
//        let eurMasterPriceString = "12 340 000 €"
//        let gbpMasterPriceString = "£12,340,000"
//        
//        XCTAssertEqual(usdPriceString, usdMasterPriceString)
//        XCTAssertEqual(eurPriceString, eurMasterPriceString)
//        XCTAssertEqual(gbpPriceString, gbpMasterPriceString)
//    }
//    
//    func testNSNumberPriceStringWithFixedFractionDigits() {
//        let usdPriceString = nsNumberPrice.getPriceStringWithFixedFractionDigits(
//            numberOfFractionDigits: 0,
//            currencyCode: usLocale.currencyCode
//        )
//        
//        let eurPriceString = nsNumberPrice.getPriceStringWithFixedFractionDigits(
//            numberOfFractionDigits: 2,
//            locale: frLocale
//        )
//        
//        let gbpPriceString = nsNumberPrice.getPriceStringWithFixedFractionDigits(
//            numberOfFractionDigits: 4,
//            currencySymbol: gbLocale.currencySymbol
//        )
//        
//        let usdMasterPriceString = "$12,340,000"
//        let eurMasterPriceString = "12 340 000,00 €"
//        let gbpMasterPriceString = "£12,340,000.0001"
//        
//        XCTAssertEqual(usdPriceString, usdMasterPriceString)
//        XCTAssertEqual(eurPriceString, eurMasterPriceString)
//        XCTAssertEqual(gbpPriceString, gbpMasterPriceString)
//    }
//    
//    func testNSNumberPriceStringUsingSignificantDigits() {
//        let usdPriceString = nsNumberPrice.getPriceStringUsingSignificantDigits(
//            currencyCode: usLocale.currencyCode
//        )
//        
//        let eurPriceString = nsNumberPrice.getPriceStringUsingSignificantDigits(
//            min: 5,
//            max: 8,
//            locale: frLocale
//        )
//        
//        let gbpPriceString = nsNumberPrice.getPriceStringUsingSignificantDigits(
//            min: 1,
//            max: 2,
//            currencySymbol: gbLocale.currencySymbol
//        )
//        
//        let usdMasterPriceString = "$12,340,000"
//        let eurMasterPriceString = "12 340 000 €"
//        let gbpMasterPriceString = "£12,000,000"
//        
//        XCTAssertEqual(usdPriceString, usdMasterPriceString)
//        XCTAssertEqual(eurPriceString, eurMasterPriceString)
//        XCTAssertEqual(gbpPriceString, gbpMasterPriceString)
//    }
//
//}
