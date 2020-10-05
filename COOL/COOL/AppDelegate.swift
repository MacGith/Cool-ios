//
//  AppDelegate.swift
//  COOL
//
//  Created by Praveen, Anand on 10/4/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = LoginRegister()
        window?.makeKeyAndVisible()
        return true
    }
}

