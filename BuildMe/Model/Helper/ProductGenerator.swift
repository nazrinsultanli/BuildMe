//
//  ProductGenerator.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 10.11.23.
//

/*

import Foundation
import RealmSwift
class ProductGenerator: ObservableObject{
    private(set) var localRealm: Realm?
    @Published var products: [Product] = []
    // let myRealm = try! Realm()
    var productData = [Product(idProduct: 1001,
                               categoryType: .laminate,
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
                       Product(idProduct: 1002,
                               categoryType: .laminate,
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
                       Product(idProduct: 1003,
                               categoryType: .laminate,
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
                       Product(idProduct: 1004,
                               categoryType: .laminate,
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
                       Product(idProduct: 1005,
                               categoryType: .asmaTavan,
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
                       Product(idProduct: 1006,
                               categoryType: .asmaTavan,
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
                       Product(idProduct: 1007,
                               categoryType: .kafel,
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
                       Product(idProduct: 1008,
                               categoryType: .kafel,
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
                       Product(idProduct: 1009,
                               categoryType: .ceramics,
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
                       Product(idProduct: 1010,
                               categoryType: .ceramics,
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
                       Product(idProduct: 1011,
                               categoryType: .accesories,
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
                       Product(idProduct: 1012,
                               categoryType: .accesories,
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
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                    // Perform migration if needed
                }
            })

            Realm.Configuration.defaultConfiguration = config

            localRealm = try Realm(configuration: config)

            // Print the fileURL
            if let realmFileURL = localRealm?.configuration.fileURL {
                print("Realm File Path: \(realmFileURL.path)")
            } else {
                print("Realm File URL is nil.")
            }
        } catch {
            print("Error opening Realm", error)
        }
    }

    // ...

    func getPath() {
        if let realmFileURL = localRealm?.configuration.fileURL {
            print("Realm File Path: \(realmFileURL.path)")
        } else {
            print("Realm File URL is nil.")
        }
    }

    // ...

    init() {
        openRealm()
        getPath()
        products.removeAll()
        saveItems()
        getProduct()
    }

    
    func getProduct() {
        if let localRealm = localRealm {
            let allProducts = localRealm.objects(Product.self)
            
            
            allProducts.forEach { singleProduct in
                products.append(singleProduct)
            }
        }
    }
    
    

    
    func saveItems() {
        if let localRealm = localRealm {
         
 
 
        }
    }
    
    
    func updateFavoriteProduct(productId: Int, favStatus: Bool) {
        
        guard let product = localRealm?.object(ofType: Product.self, forPrimaryKey: productId)
        else{
            print("product \(productId) not found" )
            return
        }
        try! localRealm?.write{
            product.favorited = favStatus
            print("product \(productId) updated" )
        }
    }
    
    
    //    func fetch(){
    //        let data = myRealm.objects(Product.self)
    //        productData.removeAll()
    //        productData.append(contentsOf: data)
    //
    //    }
    //
    func getInfoById(id: Int) -> Product? {
        let pro = products.filter{$0.idProduct == id}.first
        return pro
    }
    
    
    /*
     func updateFavoriteProduct(productFromPage: Product, favStatus: Bool){
     
     let product = myRealm.objects(Product.self).filter {
     $0.idProduct == productFromPage.idProduct
     }.first
     print("update--")
     print(product)
     try! myRealm.write {
     
     productFromPage.favorited = favStatus
     print(product)
     product?.favorited = productFromPage.favorited
     }
     
     }
     
     */
    
    /*
     func updateFavoriteProduct(productFromPage: Product, favStatus: Bool) {
     
     
     guard let product = myRealm.object(ofType: Product.self, forPrimaryKey: productFromPage.idProduct) else {
     print("Product not found in Realm.")
     return
     }
     
     do {
     try myRealm.write {
     product.favorited = favStatus
     }
     } catch {
     print("Error updating product in Realm: \(error.localizedDescription)")
     }
     }
     */
    
    /*
     
     func updateFavoriteProduct(productId: Int, favStatus: Bool) {
     if let product = myRealm.object(ofType: Product.self, forPrimaryKey: productId)
     {
     print("inupdate---------------------")
     print(product)
     try! myRealm.write {
     product.favorited = favStatus
     }
     }
     }
     */
    
    
    
}

*/

import Foundation
import RealmSwift
class ProductGenerator: ObservableObject{
    //private(set) var localRealm: Realm?
    let localRealm = try! Realm()
    var products = [Product]()
   // @Published var products: [Product] = []
    // let myRealm = try! Realm()
    var productData = [Product(idProduct: 1001,
                               categoryType: .laminate,
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
                       Product(idProduct: 1002,
                               categoryType: .laminate,
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
                       Product(idProduct: 1003,
                               categoryType: .laminate,
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
                       Product(idProduct: 1004,
                               categoryType: .laminate,
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
                       Product(idProduct: 1005,
                               categoryType: .asmaTavan,
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
                       Product(idProduct: 1006,
                               categoryType: .asmaTavan,
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
                       Product(idProduct: 1007,
                               categoryType: .kafel,
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
                       Product(idProduct: 1008,
                               categoryType: .kafel,
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
                       Product(idProduct: 1009,
                               categoryType: .ceramics,
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
                       Product(idProduct: 1010,
                               categoryType: .ceramics,
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
                       Product(idProduct: 1011,
                               categoryType: .accesories,
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
                       Product(idProduct: 1012,
                               categoryType: .accesories,
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
    
    func fetch(){
        let data = localRealm.objects(Product.self)
        products.removeAll()
        products.append(contentsOf: data)
    }


    func getPath() {
        if let realmFileURL = localRealm.configuration.fileURL {
            print("Realm File Path: \(realmFileURL.path)")
        } else {
            print("Realm File URL is nil.")
        }
    }


    init() {
        //openRealm()
        getPath()
        print("delete------")
        print(products)
        print("remove------")
        products.removeAll()
        print(products)
//        do {
//            try localRealm.write {
//                localRealm.deleteAll()
//                print("delet  product to Realm!")
//            }
//        } catch {
//            print("Error adding course to Realm", error)
//        }
        print("save------")
        saveItems()
        print(products)
        print("get-----")
        getProduct()
        
        
    }

    
    func getProduct() {
            let allProducts = localRealm.objects(Product.self)
            allProducts.forEach { singleProduct in
                products.append(singleProduct)
            }
    }
    func saveItems() {
        do{
            try localRealm.write{
                for i in 0..<productData.count{
                    localRealm.add(productData[i])
                    print("yazir: \(i)")
                }
                fetch()
            }
        } catch{
            print(error.localizedDescription)
        }
    }
    
    
    func updateFavoriteProduct(productId: Int, favStatus: Bool) {
        
        guard let product = localRealm.object(ofType: Product.self, forPrimaryKey: productId)
        else{
            print("product \(productId) not found" )
            return
        }
        try! localRealm.write{
            product.favorited = favStatus
            print("product \(productId) updated" )
        }
    }

    func getInfoById(id: Int) -> Product? {
        let pro = products.filter{$0.idProduct == id}.first
        return pro
    }
    
  
    
}
