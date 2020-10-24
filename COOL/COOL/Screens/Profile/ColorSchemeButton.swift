//
//  ColorSchemeButton.swift
//  COOL
//
//  Created by Yura on 10/24/20.
//

import UIKit

class ColorSchemeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    fileprivate func configure() {
        
        layer.cornerRadius = frame.size.height / 2
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 1
        
        clipsToBounds = true
    }
}
