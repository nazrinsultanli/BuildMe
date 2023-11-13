//
//  UserHelper.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 13.11.23.
//

import Foundation
import RealmSwift
class UserHelper {
    let myRealm = try! Realm()
    
    var userData = [User(fullName: "naz 1 naz", email: "1", password: "1")]
    
    func saveItems(){
        do{
            try myRealm.write{
                myRealm.add(userData)
                fetch()
            }
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func fetch(){
        let data = myRealm.objects(User.self)
        userData.removeAll()
        userData.append(contentsOf: data)
    }
}
