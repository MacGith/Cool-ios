//
//  Home.swift
//  COOL
//
//  Created by Yura on 10/5/20.
//

import UIKit

class Home: UIViewController {
    
    @IBOutlet weak var coolMindView: UIView!
    @IBOutlet weak var warmHeartView: UIView!
    @IBOutlet weak var lightStepView: UIView!
    
    @IBOutlet weak var coolMindText: UILabel!
    @IBOutlet weak var warmHeartText: UILabel!
    @IBOutlet weak var lightStepText: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yesterdayScoreLabel: UILabel!
    
    @IBOutlet weak var madeNoteLabel: UILabel!
    @IBOutlet weak var noteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Home"
        view.backgroundColor = .white
        
        configureUI()
        configureGestureRecognizers()
    }
    
    /// Following UI elements being configured:
    ///
    fileprivate func configureUI() {
        // Date
        let today = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE MMMM d"
        dateLabel.text = dateFormatter.string(from: today)
        // Score
        scoreLabel.text = "Score +125"
        
        let textSize: CGFloat = 17
        
        let attributedTitleCM = NSMutableAttributedString()
        attributedTitleCM.append(NSAttributedString(string: "my ", attributes: [.font: UIFont.systemFont(ofSize: textSize, weight: .regular)]))
        attributedTitleCM.append(NSAttributedString(string: "Cool Mind ", attributes: [.font: UIFont.systemFont(ofSize: textSize, weight: .bold)]))
        attributedTitleCM.append(NSAttributedString(string: "day\n", attributes: [.font: UIFont.systemFont(ofSize: textSize, weight: .regular)]))
        attributedTitleCM.append(NSAttributedString(string: "How's my mindset today?", attributes: [.font: UIFont.systemFont(ofSize: 12, weight: .regular)]))
        
        coolMindText.attributedText = attributedTitleCM
        coolMindText.numberOfLines = 0
        coolMindText.lineBreakMode = .byWordWrapping
        coolMindText.textColor = .white
        
        let attributedTitleWH = NSMutableAttributedString()
        attributedTitleWH.append(NSAttributedString(string: "my ", attributes: [.font: UIFont.systemFont(ofSize: textSize, weight: .regular)]))
        attributedTitleWH.append(NSAttributedString(string: "Warm Heart ", attributes: [.font: UIFont.systemFont(ofSize: textSize, weight: .bold)]))
        attributedTitleWH.append(NSAttributedString(string: "day\n", attributes: [.font: UIFont.systemFont(ofSize: textSize, weight: .regular)]))
        attributedTitleWH.append(NSAttributedString(string: "How are my emotions today?", attributes: [.font: UIFont.systemFont(ofSize: 12, weight: .regular)]))
        
        warmHeartText.attributedText = attributedTitleWH
        warmHeartText.numberOfLines = 0
        warmHeartText.lineBreakMode = .byWordWrapping
        warmHeartText.textColor = .white
        
        let attributedTitleLS = NSMutableAttributedString()
        attributedTitleLS.append(NSAttributedString(string: "my ", attributes: [.font: UIFont.systemFont(ofSize: textSize, weight: .regular)]))
        attributedTitleLS.append(NSAttributedString(string: "Light Step ", attributes: [.font: UIFont.systemFont(ofSize: textSize, weight: .bold)]))
        attributedTitleLS.append(NSAttributedString(string: "day\n", attributes: [.font: UIFont.systemFont(ofSize: textSize, weight: .regular)]))
        attributedTitleLS.append(NSAttributedString(string: "What's my carbon footprint?", attributes: [.font: UIFont.systemFont(ofSize: 12, weight: .regular)]))
        
        lightStepText.attributedText = attributedTitleLS
        lightStepText.numberOfLines = 0
        lightStepText.lineBreakMode = .byWordWrapping
        lightStepText.textColor = .white
    }
    
    fileprivate func configureGestureRecognizers() {
        coolMindView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(coolMindViewTapped)))
        warmHeartView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(warmHeartViewTapped)))
        lightStepView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(lightStepViewTapped)))
    }
    
    @objc func coolMindViewTapped() {
        let alert = UIAlertController(title: "User Interaction", message: "Cool Mind button tapped", preferredStyle: .alert)
        present(alert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func warmHeartViewTapped() {
        let alert = UIAlertController(title: "User Interaction", message: "Warm Heart button tapped", preferredStyle: .alert)
        present(alert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func lightStepViewTapped() {
        let alert = UIAlertController(title: "User Interaction", message: "Light Step button tapped", preferredStyle: .alert)
        present(alert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func noteTapped(_ sender: UIButton) {
    }
    
}
