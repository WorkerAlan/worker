//
//  zData.swift
//  Alex
//
//  Created by Alan on 2020/11/20.
//

import Foundation

extension NSData {
    var swift_data: Data {
        return self as Data
    }
}

extension Data {
    var oc_data: NSData {
        return self as NSData
    }

    var utf8String: String {
        return String(data: self, encoding: String.Encoding.utf8) ?? ""
    }

    func hexString(prefix: Bool = false) -> String {
        return prefix ? "0x" + hexString : hexString
    }

    var hexString: String {
        return map { String(format: "%02X", $0) }.joined()
    }

    //        return withUnsafeBytes { (bytes: UnsafePointer<UInt8>) -> String in
    //            let buffer = UnsafeBufferPointer(start: bytes, count: count)
    //            return buffer.map(<#T##transform: (UInt8) throws -> T##(UInt8) throws -> T#>)
    //        }

    var reverseHex: Data {
        return Data(reversed())
    }

    var reserseHexString: String {
        return reverseHex.hexString
    }

    var base64Data: Data {
        return Data(base64Encoded: self, options: Base64DecodingOptions(rawValue: 0)) ?? Data()
    }

    var base64String: String {
        return base64Data.utf8String
    }
}
