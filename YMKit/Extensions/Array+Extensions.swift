//
//  Array+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 8/26/19.
//  Copyright © 2019 Yakov Manshin. All rights reserved.
//

// MARK: - YMSafeSubscriptable

extension Array: YMSafeSubscriptable { }

// MARK: - Conditional Append and Insertion

extension Array {
    
    /// Adds a new element at the end of the array if the specified closure evaluates to `true`.
    ///
    /// - Parameter newElement: The element to append to the array.
    /// - Parameter conditionClosure: The closure to evaluate.
    @inlinable
    public mutating func append(
        _ newElement: Element,
        if conditionClosure: @autoclosure () -> Bool
    ) {
        if conditionClosure() {
            self.append(newElement)
        }
    }
    
    /// Adds the elements of a sequence to the end of the array if the specified closure evaluates to `true`.
    ///
    /// - Parameter newElements: The elements to append to the array.
    /// - Parameter conditionClosure: The closure to evaluate.
    @inlinable
    public mutating func append<S>(
        contentsOf newElements: S,
        if conditionClosure: @autoclosure () -> Bool
    ) where Element == S.Element, S: Sequence {
        if conditionClosure() {
            self.append(contentsOf: newElements)
        }
    }
    
    /// Inserts a new element at the specified position.
    ///
    /// - Parameter newElement: The new element to insert into the array.
    /// - Parameter i: The position at which to insert the new element. `index` must be a valid index of the array or equal to its `endIndex` property.
    /// - Parameter conditionClosure: The closure to evaluate.
    @inlinable
    public mutating func insert(
        _ newElement: Element,
        at i: Int,
        if conditionClosure: @autoclosure () -> Bool
    ) {
        if conditionClosure() {
            self.insert(newElement, at: i)
        }
    }
    
}
