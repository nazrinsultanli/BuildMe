//
//  BasketPageViewModel.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 21.11.23.
//

import Foundation

import Foundation
class BasketPageViewModel{
    var productData: [PRODUCTJs] = []
    var total: Double = 0.0

    func refreshData() {
        ParserforFav.shared.readData(from: "productLocal.json") { [weak self] (products: [PRODUCTJs]?) in
            if let products = products {
                self?.productData = products
            }
        }
    }
}
