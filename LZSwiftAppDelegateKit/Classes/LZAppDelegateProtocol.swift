//
//  LZAppDelegateProtocol.swift
//  LZSwiftAppDelegateKit
//
//  Created by Sun Moon on 2020/3/2.
//

import Foundation
import UserNotifications
import UIKit

public protocol LZAppActionDelegate {
    
    var delayedActions: [String]? { get }
    
    /// 延迟执行
    /// - Parameter name: key
    func delayedExecution(_ action: String)
}
 
public protocol LZAppManagerProtocol: UIApplicationDelegate, UNUserNotificationCenterDelegate, LZAppActionDelegate {
    
}

