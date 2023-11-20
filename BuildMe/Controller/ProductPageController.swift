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
    
    var viewModel = ProductPageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let selectedProduct = viewModel.getInfoById(id: viewModel.receivedProductId) {
            setProduct(product: selectedProduct)
        } else {
        }
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !viewModel.temperoryFavProduct.isEmpty{
            viewModel.favProductData.append(viewModel.temperoryFavProduct[0])
            FavoriteFromJson.shared.writeFavProducts(writeFavProduct: viewModel.favProductData)

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
        
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        print("state: \(viewModel.favState )")
        if viewModel.favState {
            if let selectedProduct = viewModel.getInfoById(id: viewModel.receivedProductId) {
                viewModel.temperoryFavProduct.append(selectedProduct)
            } else {
            }
            updateUI()
            viewModel.favState = false
            
        }else{
            if viewModel.getInfoById(id: viewModel.receivedProductId) != nil {
                viewModel.temperoryFavProduct.removeLast()
            } else {
            }
            updateUI()
            viewModel.favState = true
        }
    }
    
    func updateUI() {
        if viewModel.favState {
            favoriteButtonn.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        }else{
            favoriteButtonn.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
}
