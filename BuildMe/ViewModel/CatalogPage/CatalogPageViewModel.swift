//
//  CatalogPageViewModel.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 12.11.23.
//

import Foundation

class CatalogPageViewModel{
    
    var categoryData = CategoryHelper().categoryData
    var filteredProduct: [Product] = []
    var selectedCategoryType: CategoryProduct?
    var productData = ProductGenerator().products
    
    func filteredData() -> [Product]{
        if (selectedCategoryType != nil){
            filteredProduct = productData.filter({ $0.categoryType == selectedCategoryType })
                return filteredProduct
        }
        else{
            return productData
        }
    }
    
    
    
}
