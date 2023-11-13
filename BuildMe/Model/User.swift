//
//  User.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 13.11.23.
//

import Foundation
import RealmSwift

class User: Object{
    @Persisted var fullName: String
    @Persisted var email: String
    @Persisted var password: String
    
    convenience init(fullName: String,
                     email: String,
                     password: String) {
        self.init()
        self.fullName = fullName
        self.email = email
        self.password = password
    }
}
