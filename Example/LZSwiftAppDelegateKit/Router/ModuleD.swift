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
import LZSwiftDelegate

let scheme = "zzscs://"

let demo1: String = "\(scheme)testd"
let demo2: String = "\(scheme)web?p=https://www.48.cn"
let demo3: String = "\(scheme)alert?title=提示&message=人"
let demo4: String = "\(scheme)handle"
let demo5: String = "\(scheme)delegate" // 代理必须延迟执行
let demo6: String = "\(scheme)isLogin"
let demo7: String = "\(scheme)overFullScreen"

var isLogin: Bool = false

public enum Animated {
    case push
    case present
}

public enum AnimaterTimer {
    case `default`
    case push
    case delegate
    case overFullScreen
}

extension AnimaterTimer {
    var timer: DispatchTime {
        switch self {
        case .default:
            return .now() + 0.25
        case .delegate:
            return .now() + 0.25
        case .push:
            return .now() + 0.25
        case .overFullScreen:
            return .now() + 1.0
        }
    }
}

//extension ModuleD: NavigatorDelegate {
//    func shouldPresent(viewController: UIViewController, from: UIViewControllerType) -> Bool {
//        return true
//    }
//
//    func shouldPush(viewController: UIViewController, from: UINavigationControllerType) -> Bool {
//        return true
//    }
//}

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
            if let delegate = context as? LZSwiftDelegate<Bool, String>  {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                    let s = delegate.call(true)
                    print("delegate -- \(s ?? "") ")
                }
            }
            return true
        }
        
        navigator.register(demo6) { [weak self] (url, value, context) -> UIViewController? in
            if let login = self?.makeLogin(url, target: .push, wait: .push) {
                navigator.present(login)
                return nil
            } else {
                return UIViewController()
            }
        }
        
        navigator.register(demo7) { [weak self] (url, values, context) -> UIViewController? in
            if let login = self?.makeLogin(url, target: .present, wait: .overFullScreen) {
                navigator.present(login)
                return nil
            } else {
                let presentVc = PresentModelViewController()
                presentVc.modalPresentationStyle = .overFullScreen
                return presentVc
            }
        }
        
        return true
    }
        
    func makeLogin(_ url: URLConvertible, target animated: Animated, wait: AnimaterTimer) -> UIViewController? {
        if isLogin {
            return nil
        } else {
            let login = WebViewController()
            login.delegate.delegate(on: self) { (_, _) in
                DispatchQueue.main.asyncAfter(deadline: wait.timer) {
                    switch animated {
                    case .push:
                        navigator.push(url)
                    case .present:
                        navigator.present(url)
                    }
                }
            }
            return login
        }
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
