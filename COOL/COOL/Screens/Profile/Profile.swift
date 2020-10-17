//
//  Profile.swift
//  COOL
//
//  Created by Yura on 10/5/20.
//

import UIKit

class Profile: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Profile"
        view.backgroundColor = .white
        
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
    }
}
