//
//  PersonNameFormatterTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 10/10/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

@available(iOS, introduced: 9)
final class PersonNameFormatterTests: XCTestCase {
    
    let prefix = "Mr."
    let firstName = "Francis"
    let middleName = "Joseph"
    let nickname = "Frank"
    let lastName = "Underwood"
    
    func testDefaultPersonNameString() {
        
        let personNameString = YMFormatter.getPersonNameString(
            firstName: firstName,
            lastName: lastName
        )
        
        let masterPersonNameString = "Francis Underwood"
        
        XCTAssertEqual(personNameString, masterPersonNameString)
    }
    
    func testLongPersonNameString() {
        let personNameString = YMFormatter.getPersonNameString(
            withStyle: .long,
            prefix: prefix,
            firstName: firstName,
            middleName: middleName,
            nickname: nickname,
            lastName: lastName
        )
        
        let masterPersonNameString = "Mr. Francis Joseph Underwood"
        
        XCTAssertEqual(personNameString, masterPersonNameString)
    }
    
    func testMediumPersonNameString() {
        let personNameString = YMFormatter.getPersonNameString(
            withStyle: .medium,
            prefix: prefix,
            firstName: firstName,
            middleName: middleName,
            nickname: nickname,
            lastName: lastName
        )
        
        let masterPersonNameString = "Francis Underwood"
        
        XCTAssertEqual(personNameString, masterPersonNameString)
    }
    
    func testShortPersonNameString() {
        let personNameString = YMFormatter.getPersonNameString(
            withStyle: .short,
            prefix: prefix,
            firstName: firstName,
            middleName: middleName,
            nickname: nickname,
            lastName: lastName
        )
        
        let masterPersonNameString = "Frank"
        
        XCTAssertEqual(personNameString, masterPersonNameString)
    }
    
    func testAbbreviatedPersonNameString() {
        let personNameString = YMFormatter.getPersonNameString(
            withStyle: .abbreviated,
            prefix: prefix,
            firstName: firstName,
            middleName: middleName,
            nickname: nickname,
            lastName: lastName
        )
        
        let masterPersonNameString = "FU"
        
        XCTAssertEqual(personNameString, masterPersonNameString)
    }
    
}
