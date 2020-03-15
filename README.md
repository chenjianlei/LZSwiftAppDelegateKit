# LZSwiftAppDelegateKit

[![CI Status](https://img.shields.io/travis/chenjianlei/LZSwiftAppDelegateKit.svg?style=flat)](https://travis-ci.org/chenjianlei/LZSwiftAppDelegateKit)
[![Version](https://img.shields.io/cocoapods/v/LZSwiftAppDelegateKit.svg?style=flat)](https://cocoapods.org/pods/LZSwiftAppDelegateKit)
[![License](https://img.shields.io/cocoapods/l/LZSwiftAppDelegateKit.svg?style=flat)](https://cocoapods.org/pods/LZSwiftAppDelegateKit)
[![Platform](https://img.shields.io/cocoapods/p/LZSwiftAppDelegateKit.svg?style=flat)](https://cocoapods.org/pods/LZSwiftAppDelegateKit)

## Example

```
import UIKit
import LZSwiftAppDelegateKit

@UIApplicationMain
class AppDelegate: LZAppDelegate {
    
    var window: UIWindow?
    
    override func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        LZAppDelegateManager.share.regist([
            ModuleA(),
            ModuleB(),
            ModuleC(),
        ])
        return super.application(application, willFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        window? = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        window?.rootViewController = TabBarViewController()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}


```

## Author

chenjianlei, woshixiaolei@qq.com

## License

LZSwiftAppDelegateKit is available under the MIT license. See the LICENSE file for more info.
