//
//  CategoryHelper.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 12.11.23.
//

import Foundation
import RealmSwift
class CategoryHelper {
    let myRealm = try! Realm()
    var categoryData = [Categories(categoryType: .laminate, imageName: "imageLA"),
                        Categories(categoryType: .kafel, imageName: "imageKA"),
                        Categories(categoryType: .ceramics, imageName: "imageCE"),
                        Categories(categoryType: .accesories, imageName: "imageAC"),
                        Categories(categoryType: .asmaTavan, imageName: "imageAT")
    ]
    
    func saveItems() {
        do{
            try myRealm.write{
                myRealm.add(categoryData)
                fetch()
            }
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func fetch(){
        let data = myRealm.objects(Categories.self)
        categoryData.removeAll()
        categoryData.append(contentsOf: data)
        
    }
}


