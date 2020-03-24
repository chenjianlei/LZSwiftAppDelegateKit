//
//  TabBarViewController.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/13.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import URLNavigator

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let a = UINavigationController.init(rootViewController: TestAViewController())
        let b = UINavigationController.init(rootViewController: TestBViewController())
        viewControllers = [a, b]
    }

}
