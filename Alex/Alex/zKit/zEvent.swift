//
//  zEvent.swift
//  Alex
//
//  Created by Alan on 2020/11/21.
//

import Foundation

import UIKit

typealias EventHandler = (Any) -> Void

class EventReq {
    var data: Any?
    var handler: EventHandler?
}

class EventResp {
    var data: Any?
}

extension UIResponder {
    final func rquestData(data: Any?, handler: EventHandler?) {
        let req = EventReq()
        req.data = data
        req.handler = handler
    }

    func _sendData(data: EventReq) {
        var next = self.next
        while let n = next {
            let sel = NSSelectorFromString("handler(data:)")
            if n.responds(to: sel) {
                n.perform(sel, with: data)
                break
            }
            next = n.next
        }
    }
}

protocol EventReqProtocol {
    func handler(data: EventReq)
}

extension EventReqProtocol where Self: UIViewController {}
extension EventReqProtocol where Self: UIView {}
/*
 demo
 */

// class _DemoController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.rquestData(data: nil) { (resp) in
//
//        }
//    }
//
//    func handler(data: EventReq) {
//
//    }
// }
