//
//  FavoritePageViewModel.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 16.11.23.
//

import Foundation
class FavoritePageViewModel{
    var productData: [PRODUCTJs] = []

    func refreshData() {
        ParserforFav.shared.readData(from: "productLocal.json") { [weak self] (products: [PRODUCTJs]?) in
            if let products = products {
                self?.productData = products
                print(products)
            }
        }
    }
}
