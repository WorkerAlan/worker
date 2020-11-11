//
//  AppInfo.swift
//  Alex
//
//  Created by Alan on 2020/11/11.
//

import Foundation
import UIKit

class AppInfo {
    
    static let appInfo = Bundle.main.infoDictionary ?? [:]
    static let namespace = _getBaseInfo("CFBundleExecutable")
    
    static func toController(_ v: String) -> UIViewController.Type? {
        let cls = namespace + "." + v
        return NSClassFromString(cls) as? UIViewController.Type
    }
    
    static func toClass(_ v: String) -> AnyClass? {
        let cls = namespace + "." + v
        return NSClassFromString(cls)
    }
}

extension String {
    var toController: UIViewController.Type? {
        return AppInfo.toController(self)
    }
    
    var toClass: AnyClass? {
        return AppInfo.toClass(self)
    }
}

extension AppInfo {
    fileprivate class func _getBaseInfo(_ key: String) -> String {
        return (appInfo[key] as? String) ?? ""
    }
}



