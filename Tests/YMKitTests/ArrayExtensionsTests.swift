//
//  ArrayExtensionsTests.swift
//  YMKitTests
//
//  Created by Yakov Manshin on 11/6/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

import XCTest
@testable import YMKit

final class ArrayExtensionsTests: XCTestCase {
    
    private var testArray = [String]()
    
    override func setUp() {
        testArray = ["one", "two", "three", "four"]
    }
    
    // MARK: - Conditional Append
    
    private let masterNewElement = "five"
    
    func testConditionalAppendOfOneElementTrue() {
        let condition = true
        
        testArray.append(masterNewElement, if: condition)
        
        let lastElement = testArray.last
        
        XCTAssertEqual(lastElement, masterNewElement)
    }
    
    func testConditionalAppendOfOneElementFalse() {
        let condition = false
        
        testArray.append(masterNewElement, if: condition)
        
        let lastElement = testArray.last
        
        XCTAssertNotEqual(lastElement, masterNewElement)
    }
    
    private let masterNewElements = ["six", "seven"]
    
    func testConditionalAppendOfMultipleElementsTrue() {
        let condition = true
        
        testArray.append(contentsOf: masterNewElements, if: condition)
        
        let lastNElements = Array(testArray.suffix(masterNewElements.count))
        
        XCTAssertEqual(lastNElements, masterNewElements)
    }
    
    func testConditionalAppendOfMultipleElementsFalse() {
        let condition = false
        
        testArray.append(contentsOf: masterNewElements, if: condition)
        
        let lastNElements = Array(testArray.suffix(masterNewElements.count))
        
        XCTAssertNotEqual(lastNElements, masterNewElements)
    }
    
    // MARK: - Conditional Insertion
    
    private let insertionIndex = 2
    private let masterInsertedElement = "two and a half"
    
    func testConditionalInsertionTrue() {
        let condition = true
        
        testArray.insert(masterInsertedElement, at: insertionIndex, if: condition)
        
        let insertedElement = testArray[insertionIndex]
        
        XCTAssertEqual(insertedElement, masterInsertedElement)
    }
    
    func testConditionalInsertionFalse() {
        let condition = false
        
        testArray.insert(masterInsertedElement, at: insertionIndex, if: condition)
        
        let insertedElement = testArray[insertionIndex]
        
        XCTAssertNotEqual(insertedElement, masterInsertedElement)
    }
    
    // MARK: - Conditional Removal
    
    private let removalIndex = 3
    private let masterRemovedElement = "four"
    
    func testConditionalRemovalTrue() {
        let condition = true
        
        let removedElement = testArray.remove(at: removalIndex, if: condition)
        
        XCTAssertEqual(removedElement, masterRemovedElement)
    }
    
    func testConditionalRemovalFalse() {
        let condition = false
        
        let removedElement = testArray.remove(at: removalIndex, if: condition)
        
        XCTAssertNotEqual(removedElement, masterRemovedElement)
    }
    
}
