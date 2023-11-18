//
//  UserHelper.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 13.11.23.
//

import Foundation
import RealmSwift

/*
class FavoriteHelper {
    let myRealm = try! Realm()
    
    
    func saveItems(favoriteProduct: Product){
        do{
            try myRealm.write{
                myRealm.add(favoriteProduct)
            }
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func fetch()->[Product]{
        
        do{
            let data = myRealm.objects(Product.self)
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
}
*/



class FavoriteHelper {
//    let myRealm = try! Realm()
//
//    func saveItems(favoriteProduct: Product) {
//        do {
//            try myRealm.write {
//                // Check if the product is already in favorites
//                if let existingFavorite = myRealm.objects(Product.self).filter("modelCode == %@", favoriteProduct.modelCode).first {
//                    // Product is already in favorites, remove it
//                    myRealm.delete(existingFavorite)
//                } else {
//                    // Product is not in favorites, add it
//                    myRealm.add(favoriteProduct)
//                }
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func fetch() -> [Product] {
//        do {
//            let data = myRealm.objects(Product.self)
//            return Array(data)
//        } catch {
//            print(error.localizedDescription)
//            return []
//        }
//    }
//
//    func getPath() {
//        if let url = myRealm.configuration.fileURL {
//            print("Realm File Path:\(url)")
//        }
//    }
//    
//    
  
}

