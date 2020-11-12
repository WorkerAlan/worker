//
//  String+Extensions.swift
//  Alex
//
//  Created by Alan on 2020/11/6.
//

import Foundation
import UIKit
import CoreText

extension String {
    var oc_string: NSString {
        return self as NSString
    }
    
    var doubleValue: Double {
        return oc_string.doubleValue
    }
    
    var floatValue: Float {
        return oc_string.floatValue
    }
    
    var intValue: Int32 {
        return oc_string.intValue
    }
    
    var longLongValue: Int64 {
        return oc_string.longLongValue
    }
    
    var integerValue: Int {
        return oc_string.integerValue
    }
    
    var length: Int {
        return count
    }
    
    func contain(_ find: String) -> Bool {
        return range(of: find) != nil
    }
    
    func containsIgnoricase(_ find: String) -> Bool {
        return lowercased().contain(find.lowercased())
    }
    
    var base64: String {
        guard let data = oc_string.data(using: String.Encoding.utf8.rawValue) else {
            return ""
        }
        return data.base64EncodedString()
    }
    
    var hexInt: Int {
        return Int(self, radix: 16) ?? 0
    }
    
    var toTrim: String {
        return trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    var percentEncoding: String? {
        return addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)
    }
    
    var toURL: URL? {
        return URL(string: percentEncoding ?? "")
    }
    
    func rectSize(_ font: UIFont, _ size: CGSize) -> CGSize {
        return oc_string.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [.font: font], context: nil).size
    }
    
    func rectHeight(_ font: UIFont, _ size: CGSize) -> CGFloat {
        return rectSize(font, size).height
    }
    
    func rectWidth(_ font: UIFont, _ size: CGSize) -> CGFloat {
        return rectSize(font, size).width
    }
    
    func singlineSize(_ font: UIFont) -> CGSize {
        return oc_string.size(withAttributes: [.font: font])
    }
    
    func singlineHeight(_ font: UIFont) -> CGFloat {
        return singlineSize(font).height
    }
    
    func singlineWidth(_ font: UIFont) -> CGFloat {
        return singlineSize(font).width
    }
    
    fileprivate func validIndex(_ index: Int) -> Int {
        return 0
    }
    
    func substring(to index: Int) -> String {
        return oc_string.substring(to: index)
    }
    
    func substring(from index: Int) -> String {
        return oc_string.substring(from: index)
    }
    
    func substring(with range: NSRange) -> String {
        return oc_string.substring(with: range)
    }
}
