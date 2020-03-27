//
//  PresentModelViewController.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by 陈建蕾 on 2020/3/26.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class PresentModelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(bottomView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.25) {
            self.view.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self.view)
        if !bottomView.frame.contains(point!) && !bottomView.frame.contains(point!){
            self.view.backgroundColor = UIColor.init(white: 0, alpha: 0)
            dismiss(animated: true, completion: nil)
        }
    }
    
    lazy var bottomView: UIView = {
        let v = UIView.init(frame: CGRect.init(x: 0, y: view.bounds.size.height - 200, width: view.bounds.size.width, height: 200))
        v.backgroundColor = .red
        return v
    }()
}
