//
//  ModuleE.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by 陈建蕾 on 2020/3/29.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import LZSwiftAppDelegateKit
import UserNotifications

class ModuleE: LZBaseModule {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            guard let error = error else { return }
            print("errer is \(error)")
        }
        guard let launchOptions = launchOptions else { return true }
        if let userInfo = launchOptions[UIApplicationLaunchOptionsKey.remoteNotification] {
            self.application(application, didReceiveRemoteNotification: userInfo as! [AnyHashable : Any])
        }
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("userInfo -- \(userInfo)")
        completionHandler(.noData)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        guard let userInfo = userInfo["aps"] as? [String: Any] else { return }
        if let text = userInfo["alert"] as? String {
            print(text)
        }
        
        if let path = userInfo["path"] as? String {
            if let url = path.urlValue {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    guard let animated = url.queryParameters["animated"] else { return }
                    if animated == Animated.open.value {
                        navigator.open(url)
                    } else if animated == Animated.present.value {
                        navigator.present(url)
                    } else if animated == Animated.push.value {
                        navigator.push(url)
                    }
                }
            }
        }
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        print(notification)
    }
}
