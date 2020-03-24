//
//  ModuleD.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by 陈建蕾 on 2020/3/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import LZSwiftAppDelegateKit
import URLNavigator
import SafariServices

let scheme = "zzscs://"

let demo1: String = "\(scheme)testd"
let demo2: String = "\(scheme)web?p=https://www.48.cn"
let demo3: String = "\(scheme)alert?title=提示&message=人"
let demo4: String = "\(scheme)handle?s=1"
let demo5: String = "\(scheme)delegate"

class ModuleD: LZBaseModule {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        navigator.register(demo1) { (url, values, context) -> UIViewController? in
            return TestDViewController()
        }
        navigator.register(demo2, ModuleD.webViewControllerFactory)
        navigator.handle(demo3, ModuleD.alert())
        navigator.handle(demo4) { (url, values, context) -> Bool in
            if let handle = context as? ((String, String) -> Void)? {
                handle!("name", "age")
            }
            return true
        }
        navigator.handle(demo5) { (url, values, context) -> Bool in
            print(url)
            return true
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        let params = url.queryParameters
        if params["pt"] == "1" {
            if navigator.present(url, context: nil, wrap: UINavigationController.self, from: .none, animated: true, completion: nil) != nil { return true }
        }
        if navigator.push(url) != nil { return true }
        if navigator.open(url) {  return true }
        return false
    }
    
    private static func webViewControllerFactory(url: URLConvertible, values: [String: Any], context: Any?) -> UIViewController? {
        guard let url = url.urlValue else { return nil }
        guard let path = url.queryParameters["p"] else { return nil }
        return SFSafariViewController.init(url: URL.init(string: path)!)
    }
    
    private static func alert() -> URLOpenHandlerFactory {
        return { url, values, context in
            guard let title = url.queryParameters["title"] else { return false }
            let message = url.queryParameters["message"]
            let alertContoller = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
            alertContoller.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
            navigator.present(alertContoller, wrap: .none, from: .none, animated: true, completion: nil)
            return true
        }
    }
}
