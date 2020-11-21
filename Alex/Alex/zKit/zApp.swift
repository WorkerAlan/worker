//
//  zApp.swift
//  Alex
//
//  Created by Alan on 2020/11/21.
//

import UIKit

class zApp {
    static let appInfo = Bundle.main.infoDictionary ?? [:]
    static let namespace = _getBaseInfo("CFBundleExecutable")
    static let buildVersion = _getBaseInfo("CFBundleVersion")
    static let bundleIdentifier = _getBaseInfo("CFBundleIdentifier")
    static let size = UIScreen.main.bounds.size
    static func toController(_ v: String) -> UIViewController.Type? {
        let cls = namespace + "." + v
        return NSClassFromString(cls) as? UIViewController.Type
    }

    static func toClass(_ v: String) -> AnyClass? {
        let cls = namespace + "." + v
        return NSClassFromString(cls)
    }

//       static func screenSnipPng() -> Data? {
//
//           var imageSize = CGSize.zero
//
//           let orientataion = zApp.statusBarOrientation
//
//           if UIInterfaceOrientation.portrait == orientataion {
//               imageSize = UIScreen.main.bounds.size
//           } else {
//               imageSize = CGSize(width: UIScreen.main.bounds.size.height, height: UIScreen.main.bounds.size.width)
//           }
//
//           UIGraphicsBeginImageContextWithOptions(imageSize, false, UIScreen.main.scale)
//
//           defer {
//               UIGraphicsEndImageContext()
//           }
//
//           let context = UIGraphicsGetCurrentContext()
//
//           UIApplication.shared.windows.forEach { window in
//               context?.saveGState()
//               context?.translateBy(x: window.center.x, y: window.center.y)
//               context?.ctm.translatedBy(x: window.center.x, y: window.center.y)
//               context?.ctm.concatenating(window.transform)
//               context?.translateBy(x: -window.bounds.size.width * window.layer.anchorPoint.x, y: -window.bounds.size.height * window.layer.anchorPoint.y)
//               if orientataion == UIInterfaceOrientation.landscapeLeft {
//                   context?.ctm.rotated(by: CGFloat(Float.pi / 2.0))
//                   context?.ctm.translatedBy(x: 0, y: -imageSize.width)
//               } else if orientataion == UIInterfaceOrientation.landscapeRight {
//                   context?.ctm.rotated(by: -CGFloat(Float.pi / 2.0))
//                   context?.ctm.translatedBy(x: -imageSize.height, y: 0)
//               } else if orientataion == UIInterfaceOrientation.portraitUpsideDown {
//                   context?.ctm.rotated(by: CGFloat(Float.pi / 2.0))
//                   context?.ctm.translatedBy(x: -imageSize.width, y: -imageSize.height)
//               }
//
//               window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
//
//               context?.restoreGState()
//           }
//
//           if let image = UIGraphicsGetImageFromCurrentImageContext(),
//               let data = image.pngData() {
//               return data
//           }
//
//           return nil
//       }

//       static func rootViewController() -> UIViewController? {
//           guard let root = app.keyWindow?.rootViewController else { return nil }
//           var vc: UIViewController? = root
//           while let v = vc {
//               if let tab = v as? UITabBarController {
//                   if tab.children.count == 0 { return tab }
//                   return tab.selectedViewController
//               }
//               if let nav = v as? UINavigationController {
//                   if nav.children.count == 0 { return nav }
//                   return nav.children.last
//               }
//
//               if let des = v.presentedViewController {
//                   vc = des
//               }
//
//               return vc
//           }
//
//           return nil
//       }
}

func WithMainAsync(_ block: @escaping () -> Void) {
    if Thread.current.isMainThread { block() }
    else { DispatchQueue.main.async { block() } }
}

func WithDebugAsync(_ block: () -> Void) {
    #if DEBUG
        block()
    #endif
}

func zPrintln(file: String = #file,
              method: String = #function,
              line: Int = #line,
              _ data: Any?...)
{
    #if DEBUG
        NSLog("\(file.z_filename) \(method.z_method) \(line): \(_z_datas(data))")
    #endif
}

func zPrintln(file: String = #file,
              method: String = #function,
              line: Int = #line,
              _ message: String)
{
    #if DEBUG
        NSLog("\(file.z_filename) \(method.z_method) \(line): \(message)")
    #endif
}

private func _z_datas(_ data: [Any?]) -> String {
    return data.map { $0 ?? "" }.map { "\($0)" }.joined(separator: ", ")
}

extension String {
    var lastPathComponent: String {
        return oc_string.lastPathComponent
    }

    var z_filename: String {
        return lastPathComponent.replacingOccurrences(of: ".swift", with: "")
    }

    var z_method: String {
        return _z_method()
    }
}

private extension String {
    func _z_method() -> String {
        return components(separatedBy: "(").first ?? ""
    }
}

extension String {
    var toController: UIViewController.Type? {
        return zApp.toController(self)
    }

    var toClass: AnyClass? {
        return zApp.toClass(self)
    }
}

private extension zApp {
    class func _getBaseInfo(_ key: String) -> String {
        return (appInfo[key] as? String) ?? ""
    }
}
