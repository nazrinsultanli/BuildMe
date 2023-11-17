//
//  HomePageViewModel.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 12.11.23.
//

import Foundation

class HomePageViewModel {
    var categoryData = CategoryHelper().categoryData
    var productData = ProductGenerator().products
    var filteredProducts: [Product] = []
    
    func newProduct() -> [Product] {
        filteredProducts = productData.filter({ $0.new == true })
        return filteredProducts
    }
    
    func discountedProduct() -> [Product] {
        filteredProducts = productData.filter({ $0.discounted == true })
        return filteredProducts
    }
    
    func featuredProduct() -> [Product] {
        filteredProducts = productData.filter({ $0.featured == true })
        return filteredProducts
    }
    
    
    
}
