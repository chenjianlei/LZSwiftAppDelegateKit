//
//  AppDelegate.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/2.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import LZSwiftAppDelegateKit

@UIApplicationMain
class AppDelegate: LZAppDelegate {
    
    var window: UIWindow?
    
    override func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        LZAppDelegateManager.share.regist([
                 ModuleA(),
                 ModuleB(),
                 ModuleC(),
        ])
        return super.application(application, willFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window? = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        window?.rootViewController = TabBarViewController()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

