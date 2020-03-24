//
//  TestAViewController.swift
//  LZSwiftAppDelegateKit_Example
//
//  Created by Sun Moon on 2020/3/13.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import LZSwiftAppDelegateKit
import URLNavigator
import LZSwiftDelegate

class TestAViewController: UIViewController {
    
    let arrays: [String] = [
        demo1,
        demo2,
        demo3,
        demo4,
        demo5
    ]
    
    var handle: ((String, String) -> Void)?
    
    public let delegate = LZSwiftDelegate<Bool, String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(self.tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LZAppDelegateManager.share.startDelayedExecution()
    }
    
    lazy var tableView: UITableView = {
        let t = UITableView.init(frame: view.bounds, style: UITableViewStyle.plain)
        t.rowHeight = 60.0
        t.tableFooterView = UIView()
        t.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        t.dataSource = self
        t.delegate = self
        return t
    }()
}

extension TestAViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        cell?.textLabel?.text = arrays[indexPath.row]
        return cell!
    }
}

extension TestAViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = arrays[indexPath.row]
//        navigator.present(url)
//        if indexPath.row == 1 {
//            navigator.present(url)
//        }
        if navigator.push(url) != nil {
           print("ok")
        } else {
            handle = { (key, value) in
                print("key  -- \(key)")
                print("value -- \(value)")
            }
           navigator.open(url, context: "asd")
        }
    }
}
