//
//  AppPath.swift
//  Alex
//
//  Created by Alan on 2020/11/11.
//

import Foundation

class AppPath {
    
    static let HomeDirectory = NSHomeDirectory()
    
    static let DocumnetsDirectory = HomeDirectory + "/Documents"
    
    static let LibraryDirectory = HomeDirectory + "/Library"
    
    static let CachesDirectory = LibraryDirectory + "/Caches"
    
    static let PreferencesDirectory = LibraryDirectory + "/Preferences"
    
    static let TmpDirectory = HomeDirectory + "/tmp"
}
