//
//  UIView+Extension.swift
//  Alex
//
//  Created by Alan on 2020/11/12.
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
        set { x = newValue - width/2.0 }
        get { x + width/2.0 }
    }
    
    var centerY: CGFloat {
        set { y = newValue - height/2.0 }
        get { y + height/2.0 }
    }
    
    var center: CGPoint {
        set { orgin = newValue.offset(-width/2.0, -height/2.0) }
        get { CGPoint(x: centerX, y: centerY) }
    }
    
    var currentController: UIViewController? {
        var res = next
        while let r = res {
            if r.isKind(of: UIViewController.self) {
                return r as? UIViewController
            }
            res = next?.next
        }
        return nil
    }
    
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
        self.subviews.forEach { (s) in
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
        var a = [UIView]()
        
        #endif
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
