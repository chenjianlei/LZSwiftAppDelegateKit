//
//  LZAppDelegateManager.swift
//  LZSwiftAppDelegateKit
//
//  Created by Sun Moon on 2020/3/2.
//

import Foundation

public class LZAppDelegateManager: NSObject {
    
    @objc public static let share = LZAppDelegateManager()
    
    var modules = [LZAppManagerProtocol]()
    
    public var window: UIWindow?
    
    /// must first step
    /// - Parameter modules: LZAppManagerProtocol
    public func config(_ ms: [LZAppManagerProtocol]) {
        modules += ms
    }
    
    public func registModule(_ module: LZAppManagerProtocol) {
        _ = modules.contains { (m) -> Bool in
            if m.isEqual(module) {
                return true
            } else {
                modules.append(module)
                return false
            }
        }
    }
    
    public func unRegistModule(_ module: LZAppManagerProtocol) {
        modules.removeAll { (m) -> Bool in
            if m.isEqual(module) {
                return true
            } else {
                return false
            }
        }
    }
}


extension LZAppDelegateManager: UIApplicationDelegate {
    
    public func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:willFinishLaunchingWithOptions:))) {
               _ = m.application?(application, willFinishLaunchingWithOptions: launchOptions)
            }
        }
        return true
    }
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        modules.forEach { (m) in
            if m.responds(to: #selector(application(_:didFinishLaunchingWithOptions:))) {
                _ = m.application?(application, didFinishLaunchingWithOptions: launchOptions)
            }
        }
        return true
    }
    
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

