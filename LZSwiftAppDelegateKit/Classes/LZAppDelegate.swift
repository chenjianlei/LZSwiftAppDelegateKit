//
//  LZAppDelegate.swift
//  LZSwiftAppDelegateKit
//
//  Created by Sun Moon on 2020/3/2.
//

import UIKit

open class LZAppDelegate: UIResponder, UIApplicationDelegate {
    
}

// 入口
extension LZAppDelegate {
    
    open func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        _ = LZAppDelegateManager.share.application(application, willFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        _ = LZAppDelegateManager.share.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
}

// 切换事件
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

// 远程通知
extension LZAppDelegate {
    
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        LZAppDelegateManager.share.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    public func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        LZAppDelegateManager.share.application(application, didRegister: notificationSettings)
    }
    
    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        LZAppDelegateManager.share.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        LZAppDelegateManager.share.application(application, didReceiveRemoteNotification: userInfo)
    }
}

// 本地通知
extension LZAppDelegate {
    public func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
          LZAppDelegateManager.share.application(application, didReceive: notification)
      }
}

// 路由
extension LZAppDelegate {
    
    /// scheme
    /// - Parameters:
    ///   - application: application
    ///   - url: zzscs://sss.com?xx=123
    ///   - sourceApplication: ??
    ///   - annotation: ??
    public func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return LZAppDelegateManager.share.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    public func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return LZAppDelegateManager.share.application(application, handleOpen: url)
    }
    
    @available(iOS 9.0, *)
    public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return LZAppDelegateManager.share.application(app, open: url, options: options)
    }
    
}
