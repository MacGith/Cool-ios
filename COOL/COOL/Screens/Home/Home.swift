//
//  Home.swift
//  COOL
//
//  Created by Yura on 10/5/20.
//

import UIKit

class Home: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Home"
        view.backgroundColor = .white
        
        configureUI()
    }
    
    /// Following UI elements being configured:
    ///
    /// - Date label
    /// - Score label
    /// - Cool Mind, Warm Heart, Light Step buttons. Size: Screen width, 100ptx in height.
    /// *  Maybe use stack view?
    fileprivate func configureUI() {
        // Date
        let dateLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 25)))
        view.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75).isActive = true
        dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        
        let today = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE MMMM d"
        dateLabel.text = dateFormatter.string(from: today)
        // Score
        let scoreLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 25)))
        view.addSubview(scoreLabel)
        
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 20).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75).isActive = true
        
        scoreLabel.text = "Score +125"
        // Light step
        let lightStepButton = UIButton(type: .custom)
        view.addSubview(lightStepButton)
        
        lightStepButton.translatesAutoresizingMaskIntoConstraints = false
        lightStepButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        lightStepButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        lightStepButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        lightStepButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        
        let attributedTitleLS = NSMutableAttributedString()
        attributedTitleLS.append(NSAttributedString(string: "my ", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        attributedTitleLS.append(NSAttributedString(string: "Light Step ", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .bold)]))
        attributedTitleLS.append(NSAttributedString(string: "day\n", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        attributedTitleLS.append(NSAttributedString(string: "What's my carbon footprint?", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
        
        lightStepButton.setAttributedTitle(attributedTitleLS, for: .normal)
        lightStepButton.titleLabel?.numberOfLines = 0
        lightStepButton.titleLabel?.lineBreakMode = .byWordWrapping
        lightStepButton.setTitleColor(.white, for: .normal)
        lightStepButton.setImage(UIImage(named: "lightStepIcon"), for: .normal)
        lightStepButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        lightStepButton.backgroundColor = UIColor(red: 142/255, green: 203/255, blue: 125/255, alpha: 1)
        // Warm heart
        let warmHeartButtom = UIButton(type: .custom)
        view.addSubview(warmHeartButtom)
        
        warmHeartButtom.translatesAutoresizingMaskIntoConstraints = false
        warmHeartButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        warmHeartButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        warmHeartButtom.bottomAnchor.constraint(equalTo: lightStepButton.topAnchor, constant: -5).isActive = true
        warmHeartButtom.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -305).isActive = true
        
        let attributedTitleWH = NSMutableAttributedString()
        attributedTitleWH.append(NSAttributedString(string: "my ", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        attributedTitleWH.append(NSAttributedString(string: "Warm Heart ", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .bold)]))
        attributedTitleWH.append(NSAttributedString(string: "day\n", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        attributedTitleWH.append(NSAttributedString(string: "How are my emotions today?", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
        
        warmHeartButtom.setAttributedTitle(attributedTitleWH, for: .normal)
        warmHeartButtom.titleLabel?.numberOfLines = 0
        warmHeartButtom.titleLabel?.lineBreakMode = .byWordWrapping
        warmHeartButtom.setTitleColor(.white, for: .normal)
        warmHeartButtom.setImage(UIImage(named: "warmHeartIcon"), for: .normal)
        warmHeartButtom.imageEdgeInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        warmHeartButtom.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -50)
        warmHeartButtom.backgroundColor = UIColor(red: 243/255, green: 127/255, blue: 128/255, alpha: 1)
        // Cool mind
        let coolMindButton = UIButton(type: .custom)
        view.addSubview(coolMindButton)
        
        coolMindButton.translatesAutoresizingMaskIntoConstraints = false
        coolMindButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        coolMindButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        coolMindButton.bottomAnchor.constraint(equalTo: warmHeartButtom.topAnchor, constant: -5).isActive = true
        coolMindButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -405).isActive = true
        
        let attributedTitleCM = NSMutableAttributedString()
        attributedTitleCM.append(NSAttributedString(string: "my ", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        attributedTitleCM.append(NSAttributedString(string: "Cool Mind ", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .bold)]))
        attributedTitleCM.append(NSAttributedString(string: "day\n", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
        attributedTitleCM.append(NSAttributedString(string: "How's my mindset today?", attributes: [.font: UIFont.systemFont(ofSize: 14, weight: .regular)]))
        
        coolMindButton.setAttributedTitle(attributedTitleCM, for: .normal)
        coolMindButton.titleLabel?.numberOfLines = 0
        coolMindButton.titleLabel?.lineBreakMode = .byWordWrapping
        coolMindButton.setTitleColor(.white, for: .normal)
        coolMindButton.setImage(UIImage(named: "coolMindIcon"), for: .normal)
        coolMindButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        coolMindButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -50)
        coolMindButton.backgroundColor = UIColor(red: 79/255, green: 200/255, blue: 236/255, alpha: 1)
    }
}
