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
        GIDSignIn.sharedInstance().delegate = self
        
        configureUI()
    }
    
    /// Configure the UI elements of the Login/Register screen.
    ///
    /// A guidance label, buttons linking social media methods to login.
    fileprivate func configureUI() {
        //if user previously sign launch home
        if isUserPreviouslySignInGoogle() {
            launchHome()
        }
    }
    
    func isUserPreviouslySignInGoogle() -> Bool {
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
        FireBaseAuthManager.shared.loggingWithFaceBook(with: self) { [weak self] (error) in
            if let error = error {
                print("Error logging in firebase \(error.localizedDescription)")
                return
            }
            self?.launchHome()
        }
    }
    
    private func launchTabBar() {
        let tabBar = MainTabBar()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = tabBar
    }
}

extension CoolSignInViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("Failed to log into Google:", error)
            return
        }
       
        guard let idToken = user?.authentication.idToken, let accessToken = user?.authentication.accessToken else {
            return
        }
       
        let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        FireBaseAuthManager.shared.loggingWithGmail(credentials: credentials) { [weak self] (error) in
            if let error = error {
                print("Error logging in firebase \(error.localizedDescription)")
                return
            }
            self?.launchHome()
        }
    }
}

