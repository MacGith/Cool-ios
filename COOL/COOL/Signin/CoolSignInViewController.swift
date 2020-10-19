//
//  CoolSignInViewController.swift
//  COOL
//
//  Created by Praveen, Anand on 10/4/20.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit

class CoolSignInViewController: UIViewController {
    
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    
    @IBOutlet weak var fbLoginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        configureLoginUI()
        
        /*let loginButton = FBLoginButton()
               loginButton.center = view.center
               view.addSubview(loginButton)*/
    }
    
    /// Configure the UI elements of the Login/Register screen.
    ///
    /// A guidance label, buttons linking social media methods to login.
    fileprivate func configureLoginUI() {
        //if user previously sign launch home
        if isPreviouslySignIn() {
            launchHome()
        }
    }
    
    func isPreviouslySignIn() -> Bool {
        guard let isSignIn = GIDSignIn.sharedInstance()?.hasPreviousSignIn(), isSignIn else {
            return false
        }
        return true
    }
    
    func launchHome() {
        let tabBar = MainTabBar()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = tabBar
    }
    
    @IBAction func fbLoginTapped(sender: AnyObject) {
        
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
              print("Failed to login: \(error.localizedDescription)")
              return
            }
            
            guard let accessToken = AccessToken.current?.tokenString else {
              print("Failed to get access token")
              return
            }
            
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
            // Perform login by calling Firebase APIs
            Auth.auth().signIn(with: credential) { (user, error) in
              if let error = error {
                print("Login error: \(error.localizedDescription)")
                let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(okayAction)
                self.present(alertController, animated: true, completion: nil)
                return
              } else {
                self.launchTabBar()
                if let user = user {
                    let _ = user.user.photoURL
                    UserDefaults.standard.setValue(user.user.displayName, forKey: UDKeys.firstName)
                    UserDefaults.standard.setValue(nil, forKey: UDKeys.lastName)
                    UserDefaults.standard.setValue(user.user.email, forKey: UDKeys.email)
                }
              }
            }
          }
    }
    
    private func launchTabBar() {
        let tabBar = MainTabBar()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = tabBar
    }
}
