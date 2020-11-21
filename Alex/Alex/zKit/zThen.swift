//
//  zThen.swift
//  Alex
//
//  Created by Alan on 2020/11/20.
//

import UIKit

protocol Then {}
extension NSObject: Then {}
extension CGPoint: Then {}
extension CGRect: Then {}
extension CGSize: Then {}
extension CGVector: Then {}
extension Array: Then {}
extension Dictionary: Then {}
extension Set: Then {}
extension Then {
    func done() {}
}

extension Then where Self: Any {
    func with(_ block: (inout Self) throws -> Void) -> Self {
        var copy = self
        try? block(&copy)
        return copy
    }

    func `do`(_ block: (Self) throws -> Void) rethrows {
        try? block(self)
    }
}

extension Then where Self: AnyObject {
    func then(_ block: (Self) throws -> Void) rethrows -> Self {
        try? block(self)
        return self
    }
}
