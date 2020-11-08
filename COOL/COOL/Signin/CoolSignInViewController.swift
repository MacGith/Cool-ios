//
//  CoolSignInViewController.swift
//  COOL
//
//  Created by Praveen, Anand on 10/4/20.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class CoolSignInViewController: UIViewController {
    
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    @IBOutlet weak var fbLoginButton: UIButton!
    
    struct Constants {
        static let facebook = "facebook.com"
    }
    
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
        if isUserPreviouslySignInWithGmail() || isUserPreviouslySignInWithFB() {
            launchHome()
        }
    }
    
    /// After successful Google Sign In, this function populates a new CoolUser object with user information and calls the ViewModel.saveUserInfo() to persist the data
    private func saveUserInfo() {
        if let user = Auth.auth().currentUser {
            let newUser = CoolUser()
            
            newUser.firstName = user.displayName
            newUser.lastName = nil
            newUser.email = user.email
            
            func getPhoto(_ photoURL: URL?, completion: (_ image: UIImage?) -> Void) {
                if let photoURL = user.photoURL {
                    if let photoData = try? Data(contentsOf: photoURL) {
                        completion(UIImage(data: photoData))
                    }
                }
            }
            
            getPhoto(user.photoURL) { (image) in
                newUser.photo = image
                ViewModel.saveUserInfo(userInfo: newUser)
            }
        }
    }
    
    private func isUserPreviouslySignInWithGmail() -> Bool {
        if GIDSignIn.sharedInstance().hasPreviousSignIn() {
            return true
        }
        
        return false
    }
    
    private func isUserPreviouslySignInWithFB() -> Bool {
        if let providerData = Auth.auth().currentUser?.providerData {
            for userInfo in providerData {
                switch userInfo.providerID {
                case Constants.facebook:
                    self.saveUserInfo()
                    return true
                default:
                    print("provider is \(userInfo.providerID)")
                }
            }
        }
        return false
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
            self?.saveUserInfo()
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
        guard let idToken = user?.authentication.idToken, let accessToken = user?.authentication.accessToken else {
            print("Failed to log into Google:  \(error.localizedDescription)")
            return
        }
       
        let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        FireBaseAuthManager.shared.loggingWithGmail(credentials: credentials) { [weak self] (error) in
            if let error = error {
                print("Error logging in firebase \(error.localizedDescription)")
                return
            }
            self?.launchHome()
            self?.saveUserInfo()
        }
    }
}
