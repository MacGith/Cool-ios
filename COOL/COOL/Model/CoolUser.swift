//
//  CoolioUser.swift
//  COOL
//
//  Created by Yura on 10/20/20.
//

import UIKit

class CoolUser: NSObject, NSSecureCoding {
    static var supportsSecureCoding: Bool {
        return true
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(firstName, forKey: "firstName")
        coder.encode(lastName, forKey: "lastName")
        coder.encode(email, forKey: "email")
        coder.encode(city, forKey: "city")
        coder.encode(country, forKey: "country")
        coder.encode(password, forKey: "password")
        coder.encode(photo, forKey: "photo")
    }
    
    required init?(coder: NSCoder) {
        firstName = coder.decodeObject(forKey: "firstName") as? String
        lastName = coder.decodeObject(forKey: "lastName") as? String
        email = coder.decodeObject(forKey: "email") as? String
        city = coder.decodeObject(forKey: "city") as? String
        country = coder.decodeObject(forKey: "country") as? String
        password = coder.decodeObject(forKey: "password") as? String
        
        photo = coder.decodeObject(forKey: "photo") as? UIImage
    }
    
    override init() {
        super.init()
    }
    
    var firstName: String?
    var lastName: String?
    var email: String?
    var city: String?
    var country: String?
    var password: String?
    
    var photo: UIImage?
}
