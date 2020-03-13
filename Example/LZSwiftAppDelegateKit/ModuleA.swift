//
//  ModelA.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/2.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import LZSwiftAppDelegateKit

class ModuleA: NSObject, LZAppManagerProtocol {
    
    var first: Bool = false
    var index: Int = 0
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("module a will")
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("module a did")
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("module A applicationDidEnterBackground")
        if !first {
            first = true
            LZAppDelegateManager.share.unRegistModule(self)
        }
    }
}
