//
//  Toast.swift
//  Air
//
//  Created by Alan on 2018/6/4.
//  Copyright © 2018年 ClearGrass. All rights reserved.
//

import Foundation

class Toast: NSObject {
    enum Position {
        case bottom
        case top
    }

    static var notifications = [(content: String, position: Position, textColor: UIColor, background: UIColor)]()
    static let lock = NSLock()

    static var notificationView: UIButton = {
        let v = UIButton(type: .custom)
        v.backgroundColor = ARGB(0x997B_7B7B)
        v.isHidden = true
        return v
    }()

    static var notificationLab: UILabel = {
        let lab = UILabel()
        lab.textColor = ARGB(0xFFFFFF)
        lab.backgroundColor = UIColor.clear
        lab.textAlignment = .center
        lab.font = Font(14)
        lab.numberOfLines = 0
        return lab
    }()

    class func initNotifications() {
        notificationView.frame = CGRect(x: 0, y: APP.height, width: APP.width, height: 55)
        notificationView.isUserInteractionEnabled = false
        notificationView.isHidden = false
        UIApplication.shared.keyWindow?.addSubview(notificationView)

        notificationLab.frame = CGRect(x: 20, y: 10, width: APP.width - 40, height: 1000)
        notificationLab.isUserInteractionEnabled = false
        notificationView.addSubview(notificationLab)
    }

    class func toast(_ content: String, _ position: Position = Position.bottom, _ titleColor: UIColor = ARGB(0xFFFFFF), _ backColor: UIColor = ARGB(0x997B_7B7B)) {
        if notificationView.isHidden == true {
            initNotifications()
        }
        if !notifications.contains(where: { $0.content == content }) {
            notifications.append((content: content, position: position, textColor: titleColor, background: backColor))
        }
        if notifications.count == 1, state == false {
            handlerNofications()
        }
    }

    static var state: Bool = false
    class func handlerNofications() {
        guard let first = notifications.first else {
            return
        }
        notificationLab.text = first.content
        notificationLab.textColor = first.textColor
        notificationView.setBackgroundColor(first.background, for: .normal)

        let size = first.content.sizeOf(size: CGSize(width: APP.width - 40, height: 1000), font: Font(14))
        notificationLab.h = size.height
        if first.position == Position.top {
            notificationView.h = max(55 + APP.state_height, APP.state_height + size.height + 10)
            notificationView.bottom = 0
            notificationLab.bottom = notificationView.h
        } else if first.position == Position.bottom {
            notificationView.h = max(55 + APP.areaBottom, APP.areaBottom + size.height + 10)
            notificationView.y = APP.height
            notificationLab.y = 10
        } else {}
        state = true
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            if first.position == Position.top {
                notificationView.y = 0
            } else if first.position == Position.bottom {
                notificationView.bottom = APP.height
            } else {}
        }) { _ in
            UIView.animate(withDuration: 0.25, delay: 1.0, options: .curveEaseOut, animations: {
                if first.position == Position.top {
                    notificationView.bottom = 0
                } else if first.position == Position.bottom {
                    notificationView.y = APP.height
                } else {}

            }) { _ in
                if notifications.count != 0 { self.notifications.removeFirst() }
                state = false
                self.handlerNofications()
            }
        }
    }
}

extension UIResponder {
    func toast(_ content: String) {
        Toast.toast(content)
    }

    func toast(code: Int) {
        let c = AirError.errorOfCode(code: code)
        Toast.toast(c)
    }

    func toast(_ content: String, position: Toast.Position) {
        toast(content, position, ARGB(0xFFFFFF), ARGB(0x997B_7B7B))
    }

    func toast(_ content: String, titleColor _: UIColor) {
        toast(content, Toast.Position.bottom, ARGB(0xFFFFFF), ARGB(0x997B_7B7B))
    }

    func toast(_ content: String, titleColor: UIColor, background: UIColor) {
        toast(content, Toast.Position.bottom, titleColor, background)
    }

    func toast(_ content: String, _ position: Toast.Position = Toast.Position.bottom, _ titleColor: UIColor = ARGB(0xFFFFFF), _ backColor: UIColor = ARGB(0x997B_7B7B)) {
        Toast.toast(content, position, titleColor, backColor)
    }
}
