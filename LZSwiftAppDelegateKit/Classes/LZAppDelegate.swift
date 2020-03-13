//
//  LZAppDelegate.swift
//  LZSwiftAppDelegateKit
//
//  Created by Sun Moon on 2020/3/2.
//

import UIKit

open class LZAppDelegate: UIResponder, UIApplicationDelegate {
    
    open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        _ = LZAppDelegateManager.share.application(application, willFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        _ = LZAppDelegateManager.share.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
}

extension LZAppDelegate {
    public func applicationWillResignActive(_ application: UIApplication) {
        LZAppDelegateManager.share.applicationWillResignActive(application)
    }

    public func applicationDidEnterBackground(_ application: UIApplication) {
        LZAppDelegateManager.share.applicationDidEnterBackground(application)
    }

    public func applicationWillEnterForeground(_ application: UIApplication) {
        LZAppDelegateManager.share.applicationWillEnterForeground(application)
    }

    public func applicationDidBecomeActive(_ application: UIApplication) {
        LZAppDelegateManager.share.applicationDidBecomeActive(application)
    }

    public func applicationWillTerminate(_ application: UIApplication) {
        LZAppDelegateManager.share.applicationWillTerminate(application)
    }
}

extension LZAppDelegate {
    
}

extension LZAppDelegate {
    
}
