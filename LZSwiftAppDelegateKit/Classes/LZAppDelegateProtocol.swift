//
//  LZAppDelegateProtocol.swift
//  LZSwiftAppDelegateKit
//
//  Created by Sun Moon on 2020/3/2.
//

import Foundation
import UserNotifications
import UIKit
 
@objc public protocol LZAppActionDelegate {
    
    func delayAction()
}
 
public protocol LZAppManagerProtocol: UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
}

