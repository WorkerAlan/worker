//
//  Safe.swift
//  Alex
//
//  Created by Alan on 2020/11/6.
//

import UIKit

func WithMainAsync(_ block: @escaping () -> ()) {
    if Thread.current.isMainThread {
        block()
    } else {
        DispatchQueue.main.async {
            block()
        }
    }
}

func WithDebugAsync(_ block: () -> ()) {
    #if DEBUG
    block()
    #endif
}
