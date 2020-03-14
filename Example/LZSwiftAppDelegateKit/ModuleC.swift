//
//  ModuleC.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/13.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import LZSwiftAppDelegateKit

let testC_method1 = "testC_method1"
let testC_method2 = "testC_method2"

class ModuleC: NSObject, LZAppManagerProtocol {
    var delayedActions: [String]? {
        [
            testC_method1,
            testC_method2
        ]
    }
    
    func delayedExecution(_ action: String) {
        if action == testC_method1 {
            print("test C method1")
        } else if action == testC_method2 {
            print("test C method2")
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
