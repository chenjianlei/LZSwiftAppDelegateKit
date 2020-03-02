//
//  LZAppDelegateProtocol.swift
//  LZSwiftAppDelegateKit
//
//  Created by Sun Moon on 2020/3/2.
//

import Foundation
import UserNotifications
import UIKit

public protocol LZAppDataSource {
    
    /// window need root viewController, just one entity class obeys this method
    /// - Parameter application: UIApplication
    func rootViewController(_ application: UIApplication) -> UIViewController?
}

public protocol LZAppActionDelegate {
    
}
 
public protocol LZAppManagerProtocol: UIApplicationDelegate, UNUserNotificationCenterDelegate, LZAppDataSource, LZAppActionDelegate {
    
}

