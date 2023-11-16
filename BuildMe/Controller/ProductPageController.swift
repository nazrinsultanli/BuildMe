//
//  ProductPageController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class ProductPageController: UIViewController {
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var inStock: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var modelName: UILabel!
    
    @IBOutlet weak var favoriteButtonn: UIButton!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var product: Product!
    var addedToFavorite: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let product = product {
                setProduct(product: product)
                updateUI()
            } else {
                print("Error: Product is nil")
            }
        print(ProductGenerator().productData)
        
        ProductGenerator().getPath()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: Notification.Name("ProductDataUpdated"), object: nil)

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
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
        
        print("amna")
        if let productToUpdate = product {
            ProductGenerator().updateFavoriteProduct(productModelName: productToUpdate.modelName ?? .accesor1)
            updateUI()
            
            
        }}
    
    @objc func updateUI() {
        // Update your UI based on the modified product
        // For example, change the favorite button image, etc.
        if let updatedProduct = ProductGenerator().productData.first(where: { $0.modelName == product.modelName }) {
            product = updatedProduct
            if product.favorited {
                favoriteButtonn.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            } else {
                favoriteButtonn.setImage(UIImage(systemName: "bookmark"), for: .normal)
            }
        }
    }
}


