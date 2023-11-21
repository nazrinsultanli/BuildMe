//
//  ProductPageController.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class ProductPageController: UIViewController {
    
    @IBOutlet weak var orderNumber: UILabel!
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
        productImage.image = UIImage(named: product.imageName)
        definitionLabel.text = product.definition
        updateButton()
        updateUI(for: product)
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        if viewModel.favState {
            viewModel.favState = false
        }else{
            viewModel.favState = true
        }
        viewModel.updateFavById(id: viewModel.receivedProductId, state: viewModel.favState)
        updateButton()
        
    }
    
    func updateButton() {
        if viewModel.favState {
            favoriteButtonn.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        }else{
            favoriteButtonn.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
    
    @IBAction func minusButtonClicked(_ sender: Any) {
        if let updatedProduct = viewModel.getInfoById(id: viewModel.receivedProductId), updatedProduct.order > 0 {
            updatedProduct.order -= 1
            ParserforFav.shared.writeData(to: "productLocal.json", data: viewModel.productData)
            updateUI(for: updatedProduct)
        }
    }
    
    @IBAction func plusButtonClicked(_ sender: Any) {
        if let updatedProduct = viewModel.getInfoById(id: viewModel.receivedProductId) {
            updatedProduct.order += 1
            ParserforFav.shared.writeData(to: "productLocal.json", data: viewModel.productData)
            updateUI(for: updatedProduct)
        }
    }
    

    func updateUI(for product: PRODUCTJs) {
        let totalPriceValue = Double(product.order) * product.price
        totalPrice.text = "\(totalPriceValue) $"
        orderNumber.text = "\(product.order)"
    }

    @IBAction func addToChartClicked(_ sender: Any) {
        if let updatedProduct = viewModel.getInfoById(id: viewModel.receivedProductId) {
            updatedProduct.basketed = true
            ParserforFav.shared.writeData(to: "productLocal.json", data: viewModel.productData)
            let alert = UIAlertController(title: "Product \(updatedProduct.modelName) is added", message: "", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okButton)
            present(alert, animated: true)
        }
    }
    
}
