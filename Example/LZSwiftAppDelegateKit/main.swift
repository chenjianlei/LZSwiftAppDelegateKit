//
//  main.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/2.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import LZSwiftAppDelegateKit


_ = UIApplicationMain(CommandLine.argc, UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)), NSStringFromClass(UIApplication.self), NSStringFromClass(LZAppDelegate.self))
