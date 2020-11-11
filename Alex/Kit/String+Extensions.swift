//
//  String+Extensions.swift
//  Alex
//
//  Created by Alan on 2020/11/6.
//

import Foundation

extension String {
    var oc_string: NSString {
        return self as NSString
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
}
