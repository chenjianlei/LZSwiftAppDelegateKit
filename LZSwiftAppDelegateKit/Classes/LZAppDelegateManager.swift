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
    
    public var window: UIWindow?
    
    
    @objc public func rootViewController(_ application: UIApplication) -> UIViewController? {
        let module = modules.first { (m) -> Bool in
            if m.responds(to: #selector(rootViewController(_:))) {
                return true
            } else {
                return false
            }
        }
        
        if let m = module {
            return m.rootViewController(application)
        } else {
            return nil
        }
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
        print("aaa")
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
    
    public func applicationDidBecomeActive(_ application: UIApplication) {
        modules.forEach { (m) in
            if m.responds(to: #selector(applicationDidBecomeActive(_:))) {
                m.applicationDidBecomeActive?(application)
            }
        }
    }
}
