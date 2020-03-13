//
//  ModuleB.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/13.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import LZSwiftAppDelegateKit

class ModuleB: NSObject, LZAppManagerProtocol {
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("module b will")
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("module b did")
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("module B applicationDidEnterBackground")
    }
}
