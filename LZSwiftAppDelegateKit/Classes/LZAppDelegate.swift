//
//  LZAppDelegate.swift
//  LZSwiftAppDelegateKit
//
//  Created by Sun Moon on 2020/3/2.
//

import UIKit

public class LZAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    public func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        _ = LZAppDelegateManager.share.application(application, willFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        if let root = LZAppDelegateManager.share.rootViewController(application) {
            window?.rootViewController = root
        } else {
            assert(false, "❎ window must need root viewController ! ❎\n")
        }
        
        LZAppDelegateManager.share.window = window
        
        _ = LZAppDelegateManager.share.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    public func applicationDidBecomeActive(_ application: UIApplication) {
        LZAppDelegateManager.share.applicationDidBecomeActive(application)
    }
}
