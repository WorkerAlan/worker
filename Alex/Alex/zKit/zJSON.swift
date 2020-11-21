//
//  zJSON.swift
//  Alex
//
//  Created by Alan on 2020/11/20.
//

import Foundation

final class JSON {
    fileprivate var _data: Any!
    fileprivate var _map: [String: Any]?
    fileprivate var _array: [Any]?
    fileprivate var _json: Any?

    convenience init(json data: Any) {
        if let data = data as? String {
            self.init(string: data)
            return
        }

        if let data = data as? NSString {
            self.init(string: data.swift_string)
            return
        }

        if let data = data as? Data {
            self.init(data: data)
            return
        }

        if let data = data as? NSData {
            self.init(data: data.swift_data)
            return
        }
        self.init()
        _data = data
    }

    convenience init(string: String) {
        self.init(data: string.data)
    }

    convenience init(data: Data) {
        self.init()
        _data = data
        _json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
    }

    subscript(key: String) -> JSON {
        let j = JSON()
        if let d = _json as? [String: Any] {
            j._json = d[key]
        }
        return j
    }

    subscript(key: Int) -> JSON {
        let j = JSON()
        if let d = _json as? [Any] {
            j._json = d[key]
        }
        return j
    }

    var string: String? {
        if let str = _json as? String {
            return str
        }
        if let str = _json as? NSString {
            return str.swift_string
        }
        return nil
    }

    var stringValue: String {
        return string ?? ""
    }

//    var int: Int {
//        if let s = string {
//            s.intValue
//        }
//    }

    var debugDescription: String {
        return String(describing: self)
    }
}
