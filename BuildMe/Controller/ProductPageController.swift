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
    override func viewDidLoad() {
        super.viewDidLoad()

        if let product = product{
            setProduct(product: product)
        } else {
            print("Error: Product is nil")
        }
        
        
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
    }
    
    
    @IBAction func addToCartClicked(_ sender: Any) {
    }
    
}


