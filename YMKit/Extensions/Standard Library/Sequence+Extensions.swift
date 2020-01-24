//
//  Sequence+Extensions.swift
//  YMKit
//
//  Created by Yakov Manshin on 1/24/20.
//  Copyright © 2020 Yakov Manshin. All rights reserved.
//

extension Sequence {
    
    /// Returns an array of the sequence's elements sorted by the specified key path.
    ///
    /// - Parameters:
    ///   - keyPath: *Required.* The key path to a `Comparable` property on the sequence's element.
    ///   - reversed: *Optional.* Whether to sort the sequence's elements in ascending or descending order. Default is `false` (ascending).
    public func sorted<T: Comparable>(
        by keyPath: KeyPath<Element, T>,
        reversed: Bool = false
    ) -> [Self.Element] {
        self.sorted {
            let lhs = !reversed ? $0 : $1
            let rhs = !reversed ? $1 : $0
            
            return lhs[keyPath: keyPath] < rhs[keyPath: keyPath]
        }
    }
    
    /// Returns an array of elements
    ///
    /// - Parameter keyPath: *Required.* The key path to a property on the sequence's element.
    public func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
        self.map({ $0[keyPath: keyPath] })
    }
    
}
