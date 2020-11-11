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
        self.sorted { element1, element2 -> Bool in
            let lhs: Element
            let rhs: Element
            
            if !reversed {
                lhs = element1
                rhs = element2
            } else {
                lhs = element2
                rhs = element1
            }
            
            return lhs[keyPath: keyPath] < rhs[keyPath: keyPath]
        }
    }
    
}
