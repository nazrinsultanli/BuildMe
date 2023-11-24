//
//  HomePageViewModel.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 12.11.23.
//

import Foundation

class HomePageViewModel {
    var productData = ProductJsGenerator().productData
    var categoryData = CategoryHelper().categoryData
    var filteredProducts: [PRODUCTJs] = []
    
    func newProduct() -> [PRODUCTJs] {
        filteredProducts = productData.filter({ $0.new == true })
        return filteredProducts
    }
    
    func discountedProduct() -> [PRODUCTJs] {
        filteredProducts = productData.filter({ $0.discounted == true })
        return filteredProducts
    }
    
    func featuredProduct() -> [PRODUCTJs] {
        filteredProducts = productData.filter({ $0.featured == true })
        return filteredProducts
    }
}
