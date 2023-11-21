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
    
    var viewModel = ProductPageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedProduct = viewModel.getInfoById(id: viewModel.receivedProductId) {
            viewModel.favState = selectedProduct.favorited
            setProduct(product: selectedProduct)
            
        }
    }
    
    func setProduct(product:PRODUCTJs){
        if (!product.stock){
            inStock.textColor = .red
            inStock.text = "not available"
        }
        modelName.text = product.modelName
        priceLabel.text = "\(product.price) AZN"
        productImage.image = UIImage(named: product.imageName)
        definitionLabel.text = product.definition
        updateUI()
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        if viewModel.favState {
            viewModel.favState = false
        }else{
            viewModel.favState = true
        }
        viewModel.updateFavById(id: viewModel.receivedProductId, state: viewModel.favState)
        updateUI()
        
    }
    
    func updateUI() {
        if viewModel.favState {
            favoriteButtonn.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        }else{
            favoriteButtonn.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
}
