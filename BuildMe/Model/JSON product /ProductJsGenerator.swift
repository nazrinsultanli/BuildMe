//
//  FileManagerHelper.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 11.10.23.
//

import Foundation


class ProductJsGenerator {
    
    static let shared = ProductJsGenerator()
    var productData = [PRODUCTJs]()
    let helper = ProductJsFileManager()
    
    func readProducts() -> [PRODUCTJs] {
        helper.readData { item in
            self.productData = item
        }
        return productData
    }
    
    func writeProducts(product: [PRODUCTJs]) {
        helper.writeData(product: product)
    }
    
    init() {
        writeProducts(product: ProductJsParsHelper().productData)
        productData = readProducts()
    }
}
