//
//  ViewController.swift
//  COOL
//
//  Created by Praveen, Anand on 10/4/20.
//

import UIKit
import GoogleSignIn

class LoginRegister: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLoginUI()
        view.backgroundColor = .white
    }

    fileprivate func configureLoginUI() {
        let loginLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 20)))
        view.addSubview(loginLabel)
        
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        loginLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        loginLabel.text = "Login using:"
        
        let googleSignInButton = GIDSignInButton(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        view.addSubview(googleSignInButton)
        
        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        
        googleSignInButton.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20).isActive = true
        googleSignInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        googleSignInButton.isEnabled = false
    }
}

