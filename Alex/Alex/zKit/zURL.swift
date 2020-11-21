//
//  zURL.swift
//  Alex
//
//  Created by Alan on 2020/11/21.
//

import Foundation

extension URL {
    var toRequest: URLRequest {
        return URLRequest(url: self)
    }
}
