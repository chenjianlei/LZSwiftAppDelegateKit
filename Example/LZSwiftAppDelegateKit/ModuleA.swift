//
//  ModelA.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/2.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import LZSwiftAppDelegateKit

let testA_method1 = "testA_method1"
let testA_method2 = "testA_method2"

class ModuleA: NSObject, LZAppManagerProtocol {
    var delayedActions: [String]? {
        [
            testA_method1,
            testA_method2
        ]
    }
    
    func delayedExecution(_ action: String) {
        if action == testA_method1 {
            print("test A method1")
        } else if action == testA_method2 {
            print("test A method2")
        }
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {

    }
}

