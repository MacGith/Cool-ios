//
//  Profile.swift
//  COOL
//
//  Created by Yura on 10/5/20.
//

import UIKit
import Photos

class Profile: UIViewController {
    
    @IBOutlet weak var photoView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Profile"
        view.backgroundColor = .white
        
        imagePicker.delegate = self
        
        configureUI()
    }
    
    fileprivate func configureUI() {
        // Date
        let today = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE MMMM d"
        
        // Score
        let score = "125"
        
        navigationItem.title = "\(dateFormatter.string(from: today))\tScore +\(score)"
        
        // Name
        let firstName = UserDefaults.standard.object(forKey: UDKeys.firstName) as? String
        let lastName = UserDefaults.standard.object(forKey: UDKeys.lastName) as? String
        
        let nameAttributed = NSMutableAttributedString(string: "")
        if let first = firstName {
            nameAttributed.append(NSAttributedString(string: first, attributes: [.font: UIFont.systemFont(ofSize: 25, weight: .bold)]))
        }
        nameAttributed.append(NSAttributedString(string: " "))
        if let last = lastName {
            nameAttributed.append(NSAttributedString(string: last, attributes: [.font: UIFont.systemFont(ofSize: 25, weight: .bold)]))
        }
        nameLabel.attributedText = nameAttributed
        
        // Email
        let email = UserDefaults.standard.object(forKey: UDKeys.email) as? String
        
        let emailAttributed = NSMutableAttributedString(string: "")
        emailAttributed.append(NSAttributedString(string: "Email ", attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .bold)]))
        if let email = email {
            emailAttributed.append(NSAttributedString(string: email, attributes: [.font: UIFont.systemFont(ofSize: 17, weight: .regular)]))
        }
        emailLabel.attributedText = emailAttributed
    }
    
    //MARK: - Actions
    
    @IBAction func changePhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            present(imagePicker, animated: true) {
                
            }
        }
    }
}

extension Profile: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            self.photoView.image = info[.originalImage] as? UIImage
            self.photoView.makeRounded()
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension UIImageView {
    
    /// Transform UIImageView into a circle
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
