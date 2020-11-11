//
//  YMStringRepresentableTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 10/10/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

final class YMStringRepresentableTests: XCTestCase {
    
    func testIntStringValue() {
        let int = 1234
        
        let intString = int.stringValue
        
        let masterIntString = "1234"
        
        XCTAssertEqual(intString, masterIntString)
    }
    
    func testDoubleStringValue() {
        let double = 1234.5678
        
        let doubleString = double.stringValue
        
        let masterDoubleString = "1234.5678"
        
        XCTAssertEqual(doubleString, masterDoubleString)
    }
    
    func testCustomTypeStingValue() {
        let temperature = Temperature(celsius: 43)
        
        let temperatureString = temperature.stringValue
        
        let masterTemperatureString = "43.0˚C (109.4˚F)"
        
        XCTAssertEqual(temperatureString, masterTemperatureString)
    }
    
}

fileprivate struct Temperature: YMStringRepresentable {
    
    let celsius: Float
    
    var stringValue: String {
        return "\(celsius)˚C (\(celsius * 1.8 + 32)˚F)"
    }
    
}
