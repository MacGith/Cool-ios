//
//  CoolSignInViewController.swift
//  COOL
//
//  Created by Praveen, Anand on 10/4/20.
//

import UIKit

import GoogleSignIn

class CoolSignInViewController: UIViewController {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        configureLoginUI()
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
    
}
