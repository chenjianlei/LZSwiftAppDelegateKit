//
//  LZAppDelegateManager.swift
//  LZSwiftAppDelegateKit
//
//  Created by Sun Moon on 2020/3/2.
//

import Foundation

public class LZAppDelegateManager: NSObject {
    
    public static let share = LZAppDelegateManager()

    var modules = [LZAppManagerProtocol]()
    
    /// 是否是首次进入程序， 默认为false，主要针对一些延迟执行的方法
    var firstAction: Bool = false
    
    public func regist(_ ms: [LZAppManagerProtocol]) {
        modules += ms
    }
    
    public func addModule(_ module: LZAppManagerProtocol) {
        _ = modules.contains { (m) -> Bool in
            if m.isEqual(module) {
                return true
            } else {
                modules.append(module)
                return false
            }
        }
    }
    
    public func removeModule(_ module: LZAppManagerProtocol) {
        modules.removeAll { (m) -> Bool in
            if m.isEqual(module) {
                return true
            } else {
                return false
            }
        }
    }
    
    public func startDelayedExecution() {
        if !firstAction {
            firstAction = true
            modules.forEach { (m) in
                if m.conforms(to: LZAppActionDelegate.self) {
                    let mm: LZAppActionDelegate = m as! LZAppActionDelegate
                    mm.delayAction()
                }
            }
        }
    }
}

// 入口
extension LZAppDelegateManager: UIApplicationDelegate {
    
    public func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:willFinishLaunchingWithOptions:))) {
               _ = m.application?(application, willFinishLaunchingWithOptions: launchOptions)
            }
        }
        return true
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:didFinishLaunchingWithOptions:))) {
                _ = m.application?(application, didFinishLaunchingWithOptions: launchOptions)
            }
        }
        return true
    }
}

// 切换事件
extension LZAppDelegateManager {
    
    public func applicationWillResignActive(_ application: UIApplication) {
        modules.forEach { (m) in
            if m.responds(to: #selector(applicationWillResignActive(_:))) {
                m.applicationWillResignActive?(application)
            }
        }
    }

    public func applicationDidEnterBackground(_ application: UIApplication) {
        modules.forEach { (m) in
            if m.responds(to: #selector(applicationDidEnterBackground(_:))) {
                m.applicationDidEnterBackground?(application)
            }
        }
    }

    public func applicationWillEnterForeground(_ application: UIApplication) {
        modules.forEach { (m) in
            if m.responds(to: #selector(applicationWillEnterForeground(_:))) {
                m.applicationWillEnterForeground?(application)
            }
        }
    }

    public func applicationDidBecomeActive(_ application: UIApplication) {
        modules.forEach { (m) in
            if m.responds(to: #selector(applicationDidBecomeActive(_:))) {
                m.applicationDidBecomeActive?(application)
            }
        }
    }

    public func applicationWillTerminate(_ application: UIApplication) {
        modules.forEach { (m) in
               if m.responds(to: #selector(applicationWillTerminate(_:))) {
                   m.applicationWillTerminate?(application)
               }
           }
    }
}

// 远程通知
extension LZAppDelegateManager: UNUserNotificationCenterDelegate {
    
    public func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:didRegister:))) {
                m.application?(application, didRegister: notificationSettings)
            }
        }
    }
    
    public func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:didFailToRegisterForRemoteNotificationsWithError:))) {
                m.application?(application, didFailToRegisterForRemoteNotificationsWithError: error)
            }
        }
    }
    
    public func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:didRegisterForRemoteNotificationsWithDeviceToken:))) {
                m.application?(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
            }
        }
    }
    
    public func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:didReceiveRemoteNotification:))) {
                m.application?(application, didReceiveRemoteNotification: userInfo)
            }
        }
    }
}

// 本地通知
extension LZAppDelegateManager {
    
    public func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:didReceive:))) {
                m.application?(application, didReceive: notification)
            }
        }
    }
}

// 路由
extension LZAppDelegateManager {
    
    public func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:open:sourceApplication:annotation:))) {
               _ = m.application?(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
            }
        }
        return true
    }
    
    @available(iOS 9.0, *)
    public func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:open:options:))) {
                _ = m.application?(app, open: url, options: options)
            }
        }
        return true
    }
    
    public func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:handleOpen:))) {
                _ = m.application?(application, handleOpen: url)
            }
        }
        return true
    }
}
