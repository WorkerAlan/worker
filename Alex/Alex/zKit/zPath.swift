//
//  zPath.swift
//  Alex
//
//  Created by Alan on 2020/11/11.
//

import Foundation

let zFile = FileManager.default

class zPath {
    static let HomeDirectory = NSHomeDirectory()

    static let DocumnetsDirectory = HomeDirectory + "/Documents"

    static let LibraryDirectory = HomeDirectory + "/Library"

    static let CachesDirectory = LibraryDirectory + "/Caches"

    static let PreferencesDirectory = LibraryDirectory + "/Preferences"

    static let TmpDirectory = HomeDirectory + "/tmp"

    class func readCacheSize() -> String {
        return ""
    }

    class func readFiles(path: String) -> Double {
        var size: Double = 0.0
        let subpaths = zFile.subpaths(atPath: path)
        subpaths?.forEach {
            size += fileSize(path: $0)
        }
        return size
    }

    class func fileSize(path: String) -> Double {
        if !zFile.fileExists(atPath: path) {
            return 0
        }
        let size = try? zFile.attributesOfItem(atPath: path)[FileAttributeKey.size] as? Double

        return size ?? 0.0
    }

    class func subFiles(path: String) -> [String] {
        return (try? zFile.contentsOfDirectory(atPath: path)) ?? []
//        return zFile.enumerator(atPath: path)
    }
}
