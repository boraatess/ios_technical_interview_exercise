//
//  AppDelegate.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        appStart()
        return true
    }

    func appStart() {
        // Override point for customization after application launch.
        window = .init(frame: UIScreen.main.bounds)
        // let navigationController = UINavigationController()
        // navigationController.pushViewController(SplashViewController(), animated: false)
        let rootVC = SplashViewController()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        
    }


}

