//
//  ProductGenerator.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 10.11.23.
//

import Foundation
import RealmSwift
class ProductGenerator{
    let myRealm = try! Realm()
    var productData = [Product(categoryType: .laminate,
                               brandName: .swiss,
                               modelName: .swiss1,
                               modelCode: "121221",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image1",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: false,
                               new: true,
                              favorited: false),
                       Product(categoryType: .laminate,
                               brandName: .swiss,
                               modelName: .swiss2,
                               modelCode: "121221",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image2",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: true,
                               new: true,
                               favorited: false),
                       Product(categoryType: .laminate,
                               brandName: .krono,
                               modelName: .krono1,
                               modelCode: "121221",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image3",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: false,
                               new: true,
                               favorited: false),
                       Product(categoryType: .laminate,
                               brandName: .krono,
                               modelName: .krono2,
                               modelCode: "121221",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image4",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: false,
                               new: true,
                               favorited: false),
                       Product(categoryType: .asmaTavan,
                               brandName: .tavan,
                               modelName: .tavan1,
                               modelCode: "212212",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 3,
                               imageName: "image5",
                               definition: "asa sas sas as sa sa s",
                               featured: false,
                               discounted: true,
                               new: false,
                               favorited: false),
                       Product(categoryType: .asmaTavan,
                               brandName: .tavan,
                               modelName: .tavan2,
                               modelCode: "90909",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image6",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: true,
                               new: true,
                               favorited: false),
                       Product(categoryType: .kafel,
                               brandName: .kafell,
                               modelName: .kafell1,
                               modelCode: "121221",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image7",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: false,
                               new: true,
                               favorited: false),
                       Product(categoryType: .kafel,
                               brandName: .kafell,
                               modelName: .krono2,
                               modelCode: "121221",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image8",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: false,
                               new: true,
                               favorited: false),
                       Product(categoryType: .ceramics,
                               brandName: .ceramika,
                               modelName: .ceramika1,
                               modelCode: "121221",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image9",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: false,
                               new: true,
                               favorited: false),
                       Product(categoryType: .ceramics,
                               brandName: .ceramika,
                               modelName: .ceramika2,
                               modelCode: "121221",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image10",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: false,
                               new: true,
                               favorited: false),
                       Product(categoryType: .accesories,
                               brandName: .accesor,
                               modelName: .accesor1,
                               modelCode: "121221",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image1",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: false,
                               new: true,
                               favorited: false),
                       Product(categoryType: .accesories,
                               brandName: .accesor,
                               modelName: .accesor2,
                               modelCode: "121221",
                               price: 20,
                               quantity: 10,
                               stock: true,
                               rating: 5,
                               imageName: "image1",
                               definition: "asa sas sas as sa sa s",
                               featured: true,
                               discounted: true,
                               new: true,
                               favorited: false)
    ]
    
    
    func saveItems() {
        do{
            try myRealm.write{
                myRealm.add(productData)
                fetch()
            }
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func fetch(){
        let data = myRealm.objects(Product.self)
        productData.removeAll()
        productData.append(contentsOf: data)
        
    }
    
    func getPath(){
        if let url = myRealm.configuration.fileURL{
            print("Realm File Path:\(url)")
        }
    }
    
    
    
//    func updateFavoriteProduct(productModelName: ModelProduct){
//        if let index = productData.firstIndex(where: { $0.modelName == productModelName }) {
//            productData[index].favorited.toggle()
//        }
//        do{
//            try myRealm.write{
//                myRealm.add(productData)
//                fetch()
//            }
//        } catch{
//            print(error.localizedDescription)
//        }
//    }
    
    
    
    func updateFavoriteProduct(productModelName: ModelProduct) {
        if let index = productData.firstIndex(where: { $0.modelName == productModelName }) {
            do {
                try myRealm.write {
                    productData[index].favorited.toggle()
                }
                // Update the UI after the write operation is completed
                NotificationCenter.default.post(name: Notification.Name("ProductDataUpdated"), object: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
//    func updateFavoritedStatus(product: Product) {
//            do {
//                let realm = try Realm()
//                try realm.write {
//                    product.favorited.toggle()
//                }
//            } catch {
//                print("Error updating favorited status: \(error)")
//            }
//        }
    
}
