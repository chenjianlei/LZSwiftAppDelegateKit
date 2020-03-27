//
//  WebViewController.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by 陈建蕾 on 2020/3/24.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import LZSwiftDelegate

class WebViewController: UIViewController {
    
    public let delegate = LZSwiftDelegate<Void, Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "not Login！"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate.call()
        dismiss(animated: true, completion: nil)
    }
}
