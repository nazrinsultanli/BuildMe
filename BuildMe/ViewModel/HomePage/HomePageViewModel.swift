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
/*
class HomePageViewModel {
    var productData: [PRODUCTJs] = [] {
        didSet {
            updateFilteredProducts()
        }
    }

    var categoryData = CategoryHelper().categoryData
    var filteredProducts: [PRODUCTJs] = []

    func updateData(with newProducts: [PRODUCTJs]) {
        productData = newProducts
    }

    func newProduct() -> [PRODUCTJs] {
        return filteredProducts.filter({ $0.new == true })
    }

    func discountedProduct() -> [PRODUCTJs] {
        return filteredProducts.filter({ $0.discounted == true })
    }

    func featuredProduct() -> [PRODUCTJs] {
        return filteredProducts.filter({ $0.featured == true })
    }

    private func updateFilteredProducts() {
        filteredProducts = productData
    }
}

*/
/*
class HomePageViewModel {
    var categoryData = CategoryHelper().categoryData
    var productData = ProductGenerator.products
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
*/
