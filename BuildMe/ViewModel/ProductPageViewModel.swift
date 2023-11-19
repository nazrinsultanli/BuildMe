//
//  ProductPageViewModel.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 19.11.23.
//

import Foundation
import RealmSwift
class ProductPageViewModel{
    let realm = try! Realm()
    var productData = ProductJsGenerator().productData
    var receivedProductId: Int = 0
    var favState: Bool = false
    
    init(){
       getPath()
    }
    func getInfoById(id: Int) -> PRODUCTJs? {
        return productData.filter { $0.idProduct == id }.first
    }
    
    
    func addProduct(product: PRODUCTJs) {
        try! realm.write {
            realm.add(product)
        }
    }
    func deleteProduct(product: PRODUCTJs){
        try! realm.write {
                realm.delete(product)
            }
    }
    
    func getPath() {
        if let realmFileURL = realm.configuration.fileURL {
            print("Realm File Path: \(realmFileURL.path)")
        } else {
            print("Realm File URL is nil.")
        }
    }
}
