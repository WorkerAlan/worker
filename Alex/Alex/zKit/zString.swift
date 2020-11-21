//
//  zString.swift
//  Alex
//
//  Created by Alan on 2020/11/20.
//

import UIKit

extension NSString {
    var swift_string: String { return self as String }
}

extension String {
    var oc_string: NSString {
        return self as NSString
    }

    var toURL: URL? {
        return URL(string: self)
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

    var data: Data {
        return self.data(using: .utf8) ?? Data()
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

//    var toURL: URL? {
//        return URL(string: percentEncoding ?? "")
//    }

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

    fileprivate func validIndex(_: Int) -> Int {
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

    func htmlString(with _: String) -> NSAttributedString {
        return try! NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType("0")], documentAttributes: nil)
    }

//    subscript(key: RangeExpression) -> String {
//
//        return ""
//    }
//
//    subscript(key: UnboundedRange) -> String {
//
//        return ""
//    }
}
