//
//  zNavigation.swift
//  Alex
//
//  Created by Alan on 2020/11/21.
//

import UIKit

extension UINavigationController {
    func isContainController(cls: UIViewController.Type) -> Bool {
        return children.filter { $0.isKind(of: cls) }.count > 0
    }
}
