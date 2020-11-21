//
//  zView.swift
//  Alex
//
//  Created by Alan on 2020/11/20.
//

import UIKit

extension UIView {
    var size: CGSize {
        set { frame = CGRect(origin: orgin, size: newValue) }
        get { frame.size }
    }

    var orgin: CGPoint {
        set { frame = CGRect(origin: newValue, size: size) }
        get { frame.origin }
    }

    var height: CGFloat {
        set { size = CGSize(width: width, height: newValue) }
        get { size.height }
    }

    var width: CGFloat {
        set { size = CGSize(width: newValue, height: height) }
        get { size.width }
    }

    var left: CGFloat {
        set { x = newValue }
        get { x }
    }

    var right: CGFloat {
        set { x = newValue - width }
        get { x + width }
    }

    var x: CGFloat {
        set { orgin = CGPoint(x: newValue, y: y) }
        get { orgin.x }
    }

    var top: CGFloat {
        set { y = newValue }
        get { y }
    }

    var bottom: CGFloat {
        set { y = newValue - height }
        get { y + height }
    }

    var y: CGFloat {
        set { orgin = CGPoint(x: x, y: newValue) }
        get { orgin.y }
    }

    var centerX: CGFloat {
        set { x = newValue - width / 2.0 }
        get { x + width / 2.0 }
    }

    var centerY: CGFloat {
        set { y = newValue - height / 2.0 }
        get { y + height / 2.0 }
    }

    var center: CGPoint {
        set { orgin = newValue.offset(-width / 2.0, -height / 2.0) }
        get { CGPoint(x: centerX, y: centerY) }
    }

//    var currentController: UIViewController? {
//        var res = next
//        while let r = res {
//            if r.isKind(of: UIViewController.self) {
//                return r as? UIViewController
//            }
//            res = next?.next
//        }
//        return nil
//    }

    func removeSubviews() {
        var a = [UIView]()
        a.append(self)
        while let v = a.first {
            a.append(contentsOf: v.subviews)
            v.removeFromSuperview()
        }
        /*
         self.subviews.forEach { (v) in
             v.removeSubviews()
         }
         self.removeFromSuperview()
         */
    }

    var allSubViews: [UIView] {
        var v = [UIView]()
        subviews.forEach { s in
            v.append(s)
            v.append(contentsOf: s.allSubViews)
        }
        return v

//        var v1 = [UIView]()
//        var v2 = [UIView]()
//        v2.append(self)
//        while !v2.isEmpty {
//            let v = v2.removeFirst()
//            v1.append(v)
//            v2.append(contentsOf: v)
//        }
//        return v1
    }

    func randColors() {
        #if DEBUG
            allSubViews.forEach { $0.backgroundColor = UIColor.randColor }
        #endif
    }

    func addSubviews(subs: UIView...) {
        subs.forEach { addSubview($0) }
    }

    // 添加 子控件
    func addSubviews(vs: UIView...) {
        addSubviews(vs: vs)
    }

    func addSubviews(vs: [UIView]) {
        vs.forEach { addSubview($0) }
    }

    // 获取当前控制器
    var currentController: UIViewController? {
        return _currentController()
    }

    var getSnap: UIImage? {
        return _getSnap()
    }

    var shadowColor: UIColor? {
        set { layer.shadowColor = newValue?.cgColor }
        get { return layer.shadowColor?.toColor }
    }

    var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get { return layer.borderColor?.toColor }
    }

    var shadowOffset: CGSize {
        set { layer.shadowOffset = newValue }
        get { return layer.shadowOffset }
    }

    var masksToBounds: Bool {
        set { layer.masksToBounds = newValue }
        get { return layer.masksToBounds }
    }

    var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { layer.borderWidth }
    }

    var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { layer.cornerRadius }
    }

    var screenshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    var firstResponder: UIView? {
        var vs = [UIView]()
        vs.append(self)
        while let v = vs.first {
            _ = vs.removeFirst()
            if v.isFirstResponder {
                return v
            }
            vs.append(contentsOf: subviews)
        }
        return nil
    }

    func addGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        gestureRecognizers.forEach { addGestureRecognizer($0) }
    }

    func removeGestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]) {
        gestureRecognizers.forEach { removeGestureRecognizer($0) }
    }
}

extension CGPoint {
    func offsetX(_ off: CGFloat) -> CGPoint {
        return CGPoint(x: x + off, y: y)
    }

    func offsetY(_ off: CGFloat) -> CGPoint {
        return CGPoint(x: off, y: y + off)
    }

    func offset(_ off_x: CGFloat, _ off_y: CGFloat) -> CGPoint {
        return CGPoint(x: x + off_x, y: y + off_y)
    }
}

extension CGRect {
    var x: CGFloat {
        set { origin.x = newValue }
        get { origin.x }
    }

    var y: CGFloat {
        set { origin.y = newValue }
        get { origin.y }
    }

    var height: CGFloat {
        set { size.height = newValue }
        get { size.height }
    }

    var width: CGFloat {
        set { size.width = newValue }
        get { size.width }
    }
}

private extension UIView {
    func _currentController() -> UIViewController? {
        let res: UIResponder = self
        while let next = res.next {
            if let vc = next as? UIViewController {
                return vc
            }
        }
        return nil
    }

    func _getSnap() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
