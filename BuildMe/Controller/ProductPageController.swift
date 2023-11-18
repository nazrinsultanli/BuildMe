//
//  ProductPageController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

import RealmSwift

class ProductPageController: UIViewController {

    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var inStock: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var modelName: UILabel!
    
    @IBOutlet weak var favoriteButtonn: UIButton!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var receivedProductId: Int = 0

    var favState: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        let product = ProductGenerator.getInfoById(id: receivedProductId)
        if let product = product {
            setProduct(product: product)
        } else {
            
        }
        
        updateUI(receivedId: receivedProductId, favoriteButtonn: favoriteButtonn)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // updateUI()
    }
    
    func setProduct(product:Product){
        if (!product.stock){
            inStock.textColor = .red
            inStock.text = "not available"
        }
        modelName?.text = product.modelName?.rawValue
        priceLabel?.text = "\(product.price) AZN"
        productImage?.image = UIImage(named: product.imageName)
        definitionLabel?.text = product.definition
        
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        /*
        print("amna")
        if favState {
            favState = false
            
        }else{
            favState = true
        }
        
        let product = ProductGenerator().getInfoById(id: receivedProductId)
        
        if let product = product {
            print("button clicked data")
            print(product)
            
            
            // Before update
            let productsBeforeUpdate = myRealm.objects(Product.self)
            print("Products in Realm before update: \(productsBeforeUpdate)")

            // Perform update
            ProductGenerator().updateFavoriteProduct(productFromPage: product, favStatus: favState)

            // After update
            let productsAfterUpdate = myRealm.objects(Product.self)
            print("Products in Realm after update: \(productsAfterUpdate)")
            
            
            
            updateUI(receivedId: receivedProductId, favoriteButtonn: favoriteButtonn)
            
            
        } 
         */
        
        /*
        let product = ProductGenerator().getInfoById(id: receivedProductId)

            if let product = product {
                // Before update
                let productsBeforeUpdate = myRealm.objects(Product.self)
                print("Products in Realm before update: \(productsBeforeUpdate)")
                print(product)

                // Perform update
                ProductGenerator().updateFavoriteProduct(productId: product.idProduct, favStatus: favState)

                // After update
                let productsAfterUpdate = myRealm.objects(Product.self)
                print("Products in Realm after update: \(productsAfterUpdate)")
                print(product)
                updateUI(receivedId: receivedProductId, favoriteButtonn: favoriteButtonn)
            }
         */
        
        let product = ProductGenerator.getInfoById(id: receivedProductId)

            if let product = product {
                favState.toggle() // Toggle the favState
                print("Before Update - favorited: \(product.favorited), favState: \(favState)")
                ProductGenerator().updateFavoriteProduct(productId: product.idProduct, favStatus: favState)
                print("After Update - favorited: \(product.favorited), favState: \(favState)")
                updateUI(receivedId: receivedProductId, favoriteButtonn: favoriteButtonn)
            }
        
    }
    
    
    func updateUI(receivedId: Int, favoriteButtonn: UIButton) {
        
        
        /*
        let product = ProductGenerator().getInfoById(id: receivedId)
        if let product = product {
            if product.favorited {
                favoriteButtonn.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            } else {
                favoriteButtonn.setImage(UIImage(systemName: "bookmark"), for: .normal)
            }
        }
         */
        
        
        DispatchQueue.main.async {
                let product = ProductGenerator.getInfoById(id: receivedId)
                if let product = product {
                    print("Update UI - favorited: \(product.favorited)")
                    if product.favorited {
                        favoriteButtonn.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
                    } else {
                        favoriteButtonn.setImage(UIImage(systemName: "bookmark"), for: .normal)
                    }
                }
            }    }
    
    
}
