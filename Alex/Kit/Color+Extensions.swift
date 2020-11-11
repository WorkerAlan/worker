//
//  Color+Extensions.swift
//  Alex
//
//  Created by Alan on 2020/11/6.
//

import UIKit

fileprivate func _argb(_ argb: String) -> String {
    var hex = argb
    hex = hex.replacingOccurrences(of: "#", with: "")
    hex = hex.replacingOccurrences(of: "0x", with: "")
    return hex
}

fileprivate func _argb_v(_ v: Int) -> CGFloat {
    return CGFloat(v)/255.0
}

extension UIColor {
    convenience init(hex: String) {
        let hex = _argb(hex)
        let argb = hex.integerValue & 0xFFFFFFFF
        self.init(argb: argb)
    }
    
    convenience init(rgb: Int) {
        let argb = rgb | 0xFF000000
        self.init(argb: argb)
    }
    
    convenience init(argb: Int) {
        let a = argb >> 24 & 0xFF
        let r = argb >> 16 & 0xFF
        let g = argb >> 8 & 0xFF
        let b = argb & 0xFF
        self.init(red: _argb_v(r), green: _argb_v(g), blue: _argb_v(b), alpha: _argb_v(a))
    }
    
    func argb(_ argb: Int) {
        
    }
}
