//
//  zArray.swift
//  Alex
//
//  Created by Alan on 2020/11/20.
//

import Foundation

extension Array where Element: NSObject {
    mutating func remove(el: Element) {
        if let index = firstIndex(of: el) {
            remove(at: index)
        }
    }
}
