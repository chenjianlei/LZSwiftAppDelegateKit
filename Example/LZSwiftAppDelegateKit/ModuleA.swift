//
//  ModelA.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/2.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import LZSwiftAppDelegateKit

class ModuleA: LZBaseModule {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("module A didFinishLaunchingWithOptions")
        return true
    }
}

extension ModuleA: LZAppActionDelegate {
    
    func delayAction() {
        print("module A delay")
    }
}


