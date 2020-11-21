//
//  zWebController.swift
//  Alex
//
//  Created by Alan on 2020/11/21.
//

import UIKit
import WebKit
import WebViewJavascriptBridge

class BaseWebController: BaseController {
    var url: String?
    var bridge: zWebBridge!
    lazy var web = WKWebView().then {
        $0.allowsBackForwardNavigationGestures = true
    }

    convenience init(url: String) {
        self.init()
        self.url = url
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
        initDatas()
    }

    func back() {
        if web.canGoBack {
            web.goBack()
        }
    }

    func goForward() {
        if web.canGoForward {
            web.goForward()
        }
    }

    func reloadWeb() {
        web.reload()
    }

    func initSubviews() {
        web.frame = view.bounds
        view.addSubview(web)
    }

    func initDatas() {
        if let req = url?.toURL?.toRequest {
            bridge = zWebBridge(web: web)
            web.load(req)
        }
    }
}
