//
//  CatalogPageViewModel.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 12.11.23.
//

import Foundation

class CatalogPageViewModel {
    
    var categoryData = CategoryHelper().categoryData
    var filteredProduct: [PRODUCTJs] = []
    var selectedCategoryType: CategoryProduct?
    var productData = ProductJsGenerator().productData
    
    func getData() {
        if (selectedCategoryType != nil) {
            filteredProduct = productData.filter({ $0.categoryType == selectedCategoryType?.rawValue ?? ""})
        } else {
            filteredProduct = productData
        }
    }
    
    func filteredData() -> [PRODUCTJs] {
        if (selectedCategoryType != nil) {
            filteredProduct = productData.filter({ $0.categoryType == selectedCategoryType?.rawValue ?? ""})
                return filteredProduct
        } else {
            filteredProduct = productData
            return filteredProduct
        }
    }
    func searchText(searchText: String) {
           if searchText.isEmpty {
               filteredProduct = productData
           } else {
               filteredProduct = productData.filter {
                   $0.brandName.lowercased().contains(searchText) || $0.modelName.lowercased().contains(searchText)
               }
           }
       }

  
}
