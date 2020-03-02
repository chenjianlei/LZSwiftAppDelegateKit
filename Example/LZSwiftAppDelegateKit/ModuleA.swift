//
//  ModelA.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/2.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import LZSwiftAppDelegateKit
import SwiftyLoad

class ModuleA: NSObject, LZAppManagerProtocol {
    
//    @objc override class func lz_swiftLoad() {
//        LZAppDelegateManager.share.registModule(ModuleA())
//    }
    
//    override class func lz_swiftInitialize() {
//        print("aaa")
//    }
    static func swiftLoad() {
        LZAppDelegateManager.share.registModule(ModuleA())
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("aaa")
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        print("bbb")
        return true
    }
}

extension ModuleA: LZAppDataSource {
    func rootViewController(_ application: UIApplication) -> UIViewController? {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        return vc
    }
}
