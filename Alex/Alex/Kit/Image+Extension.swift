//
//  Image+Extension.swift
//  Alex
//
//  Created by Alan on 2020/11/12.
//

import UIKit

extension UIImage {
    
    var original: UIImage {
        return withRenderingMode(.alwaysOriginal)
    }
    
}
