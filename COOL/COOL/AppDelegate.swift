//
//  AppDelegate.swift
//  COOL
//
//  Created by Praveen, Anand on 10/4/20.
//

import UIKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = CoolSignInViewController()
        window?.makeKeyAndVisible()
        
        // Change navigation controller appearance
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        barButtonItemAppearance.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .highlighted)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return GIDSignIn.sharedInstance().handle(url)
    }
}

extension AppDelegate: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Failed to log into Google:", error)
        }
        
        guard  let idToken = user?.authentication.idToken else {
            return
        }
        guard let accessToken = user?.authentication.accessToken else {
            return
        }
        
        let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
       
        Auth.auth().signIn(with: credentials) { [weak self] (result, error) in
            if let error = error {
                print("Failed to create a Firebase User with Google Account: ", error)
                return
            }
            
            guard let uid = result?.user.uid else {
                return
            }
            print("Sucessfully logged into firebase with google:", uid)
            self?.saveUserInfo(user: user)
  
            DispatchQueue.main.async {
                self?.launchTabBar()
            }
        }
    }
    
    private func launchTabBar() {
        let tabBar = MainTabBar()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = tabBar
    }
    
    /// Save user info to User Defaults
    /// - Parameter user: signed in user
    private func saveUserInfo(user: GIDGoogleUser) {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(user.profile.givenName, forKey: UDKeys.firstName)
        _ = user.profile.name
        
        _ = user.profile.familyName
        _ = user.profile.email
    }
}
