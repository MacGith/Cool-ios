//
//  ViewModel.swift
//  COOL
//
//  Created by Yura on 10/20/20.
//
// This class will work directly with the model

import Foundation

class ViewModel {
    
    /// After registering for the first time, or using one of the social option to login, this function will save user information to whatever persistent media being used right now.
    /// - Parameter userInfo: User information: name, email, city, country, password
    static func saveUserInfo(userInfo: CoolUser) {
        let encodedObject = try? NSKeyedArchiver.archivedData(withRootObject: userInfo, requiringSecureCoding: true)
        UserDefaults.standard.set(encodedObject, forKey: UDKeys.user)
    }
    
    /// This function will retrieve user information to be displayed in the 'Profile' screen
    /// - Returns: Previously saved information about the user.
    static func getUserInfo() -> CoolUser? {
        if let decodedObject = UserDefaults.standard.object(forKey: UDKeys.user) as? Data {
            return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decodedObject) as? CoolUser
        }
        
        return nil
    }
}
