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
    
    
    func saveItems(userData: User){
        do{
            try myRealm.write{
                myRealm.add(userData)
            }
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func fetch()->[User]{
        
        do{
            let data = myRealm.objects(User.self)
            return Array(data)
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func getPath(){
        if let url = myRealm.configuration.fileURL{
            print("Realm File Path:\(url)")
        }
    }
    init(){
        getPath()
    }
}


