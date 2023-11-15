//
//  RegisterPageViewModel.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 13.11.23.
//

import Foundation
import RealmSwift

class RegisterPageViewModel{
    var userData = UserHelper().fetch()
    let myRealm = try! Realm()
    
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
