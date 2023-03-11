//
//  RangedReplaceableCollection + Extension.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 11.03.2023.
//

import UIKit


// function to get access to objects in array to get or delete it
extension RangeReplaceableCollection where Element: Equatable {
    @discardableResult mutating func remove(_ element: Element) -> Element? {
        if let index = firstIndex(of: element) {
            return remove(at: index)
        }
        return nil
    }
}

