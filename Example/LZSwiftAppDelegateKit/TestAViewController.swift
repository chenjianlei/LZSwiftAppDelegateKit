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
        demo5,
        demo6,
        demo7
    ]
    
    var handle: ((String, String) -> Void)?
    
    public let delegate = LZSwiftDelegate<Bool, String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(self.tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightItem)
    }
    
    lazy var rightItem: UIButton = {
        let b = UIButton.init(type: UIButtonType.custom)
        b.setTitle("no login", for: .normal)
        b.setTitle("login", for: .selected)
        b.setTitleColor(.blue, for: .normal)
        b.setTitleColor(.blue, for: .disabled)
        b.addTarget(self, action: #selector(exChange), for: .touchUpInside)
        return b
    }()
    
    @objc func exChange() {
        rightItem.isSelected = !rightItem.isSelected
        isLogin = !isLogin
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
        tableView.deselectRow(at: indexPath, animated: true)
        let url = arrays[indexPath.row]
        if indexPath.row == 0 {
            navigator.push(url)
        } else if indexPath.row == 1 {
            navigator.present(url)
        } else if indexPath.row == 2 {
            navigator.open(url)
        } else if indexPath.row == 3 {
            handle = { (key, value) in
                 print("key  -- \(key)")
                 print("value -- \(value)")
             }
            navigator.open(url, context: handle)
        } else if indexPath.row == 4 {
            navigator.open(url, context: delegate)
            delegate.delegate(on: self) { (_, input) -> String in
                print("aaaa");
                if input {
                    return "true"
                } else {
                    return "false"
                }
            }
        } else if indexPath.row == 5 {
            navigator.push(url)
        } else if indexPath.row == 6 {
            navigator.present(url)
        }
    }
}
