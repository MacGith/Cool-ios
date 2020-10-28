//
//  FireBaseAuthManager.swift
//  COOL
//
//  Created by Praveen, Anand on 10/26/20.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit


final class FireBaseAuthManager: NSObject {
    
    static let shared = FireBaseAuthManager()

    // Initialization
    private override init() {
        super.init()
    }
    
    public func initializeFireBase() {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
    }
    
    public func loggingWithFaceBook(with viewController: UIViewController, completion: @escaping (Error?) -> Void) {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: viewController) { [weak self] (result, error) in
            guard let accessToken = AccessToken.current?.tokenString else {
              print("Failed to get access token for Facebook")
              completion(error)
              return
            }
            
            let credentials = FacebookAuthProvider.credential(withAccessToken: accessToken)
            
            self?.fireBaseSignIn(with: credentials, completion: { (data, error) in
                guard let result = data, error == nil else {
                  print("FB Login Error: \(String(describing: error?.localizedDescription))")
                  completion(error)
                  return
                }
                completion(nil)
                self?.saveUserInfo(authData: result)
            })
        }
    }
    
    public func loggingWithGmail(credentials: AuthCredential, completion: @escaping (Error?) -> Void) {
        
        fireBaseSignIn(with: credentials, completion: { [weak self] (data, error) in
            guard let result = data, error == nil else {
                print("FB Login Error: \(String(describing: error?.localizedDescription))")
                completion(error)
                return
            }
            completion(nil)
            self?.saveUserInfo(authData: result)
        })
    }
    
    private func fireBaseSignIn(with credentials: AuthCredential, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        
        Auth.auth().signIn(with: credentials) { (result, error) in
            
            guard let dataResult = result else {
                completion(nil, error)
                print("Firebase login error ")
                return
            }
            
            completion(dataResult, nil)
        }
    }
    
    private func launchTabBar() {
        let tabBar = MainTabBar()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = tabBar
    }
    
    /// Save user info to User Defaults
    /// - Parameter user: signed in user
    private func saveUserInfo(authData: AuthDataResult) {
        let userDefaults = UserDefaults.standard
        let _ = authData.user.photoURL
        userDefaults.setValue(authData.user.displayName, forKey: UDKeys.firstName)
        userDefaults.setValue(nil, forKey: UDKeys.lastName)
        userDefaults.setValue(authData.user.email, forKey: UDKeys.email)
    }
}
