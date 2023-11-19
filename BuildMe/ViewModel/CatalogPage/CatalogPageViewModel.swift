//
//  CatalogPageViewModel.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 12.11.23.
//

import Foundation

class CatalogPageViewModel{
    
    var categoryData = CategoryHelper().categoryData
    var filteredProduct: [PRODUCTJs] = []
    var selectedCategoryType: CategoryProduct?
    var productData =  ProductJsGenerator().productData
    
    
   
    
    func filteredData() -> [PRODUCTJs]{
        if (selectedCategoryType != nil){
            filteredProduct = productData.filter({ $0.categoryType == selectedCategoryType?.rawValue ?? ""})
                return filteredProduct
            
        }
        else{
            return productData
        }
    }
    


    // Inside your filterData method
  
}
