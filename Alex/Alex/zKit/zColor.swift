//
//  zColor.swift
//  Alex
//
//  Created by Alan on 2020/11/20.
//

import UIKit

private func _argb(_ argb: String) -> String {
    var hex = argb
    hex = hex.replacingOccurrences(of: "#", with: "")
    hex = hex.replacingOccurrences(of: "0x", with: "")
    return hex
}

private func _argb_v(_ v: Int) -> CGFloat {
    return CGFloat(v) / 255.0
}

extension UIColor {
    var alpha: CGFloat { return argb.0 }
    var red: CGFloat { return argb.1 }
    var green: CGFloat { return argb.2 }
    var blue: CGFloat { return argb.3 }

    var argb: (CGFloat, CGFloat, CGFloat, CGFloat) {
        var a: CGFloat = 1.0
        var r: CGFloat = 1.0
        var g: CGFloat = 1.0
        var b: CGFloat = 1.0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (a, r, g, b)
    }

    func transition(to color: UIColor, progress: CGFloat) -> UIColor {
        let _argb = argb
        let toArgb = color.argb
        let a = _argb.0 + (toArgb.0 - argb.0) * progress
        let r = _argb.1 + (toArgb.1 - argb.1) * progress
        let g = _argb.2 + (toArgb.2 - argb.2) * progress
        let b = _argb.3 + (toArgb.3 - argb.3) * progress
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }

    convenience init(hex: String) {
        let hex = _argb(hex)
        let argb = hex.integerValue & 0xFFFF_FFFF
        self.init(argb: argb)
    }

    convenience init(rgb: Int) {
        let argb = rgb | 0xFF00_0000
        self.init(argb: argb)
    }

    convenience init(argb: Int) {
        let a = argb >> 24 & 0xFF
        let r = argb >> 16 & 0xFF
        let g = argb >> 8 & 0xFF
        let b = argb & 0xFF
        self.init(r: r, g: g, b: b, a: a)
    }

    convenience init(r: Int, g: Int, b: Int, a: Int = 255) {
        self.init(red: _argb_v(r), green: _argb_v(g), blue: _argb_v(b), alpha: _argb_v(a))
    }

    class var randColor: UIColor {
        let rand = Int.random(in: 0 ... Int.max) % 255
        return rand.color
    }
}

extension CGColor {
    var toColor: UIColor {
        return UIColor(cgColor: self)
    }
}

extension Int {
    var color: UIColor {
        return UIColor(rgb: self)
    }
}
