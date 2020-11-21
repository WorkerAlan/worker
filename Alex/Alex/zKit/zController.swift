//
//  zController.swift
//  Alex
//
//  Created by Alan on 2020/11/21.
//

import UIKit

let zNotificationCenter = NotificationCenter.default

class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        _initDatas()
    }

    func _initDatas() {
        view.backgroundColor = UIColor.white
    }

    deinit {
        zNotificationCenter.removeObserver(self)
    }
}

extension UIViewController {
    var isVisible: Bool {
        return isViewLoaded && view.window != nil
    }
}
