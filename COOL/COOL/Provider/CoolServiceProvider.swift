//
//  CoolServiceProvider.swift
//  COOL
//
//  Created by Praveen, Anand on 10/27/20.
//

import Foundation

class CoolServiceProvider : NSObject {
    
    func initializer() {
        FireBaseAuthManager.shared.initializeFireBase()
    }
}
