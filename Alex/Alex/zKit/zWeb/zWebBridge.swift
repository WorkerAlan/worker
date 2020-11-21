//
//  zWebBridge.swift
//  Alex
//
//  Created by Alan on 2020/11/21.
//

import UIKit
import WebKit

class zWebBridge: NSObject {
    var web: WKWebView!

    init(web: WKWebView) {
        super.init()
        self.web = web
        web.uiDelegate = self
        web.navigationDelegate = self
    }
}

extension zWebBridge: WKUIDelegate, WKNavigationDelegate {
    func webView(_: WKWebView, decidePolicyFor _: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }

    func webView(_: WKWebView, decidePolicyFor _: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(.allow)
    }
}
