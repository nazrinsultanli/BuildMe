//
//  ProductJsParsHelper.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 21.11.23.
//

import Foundation
class ProductJsParsHelper{
    let parser = Parser()
    var productData = [PRODUCTJs]()
    
    init()
    {
        pars()
    }
    
    func pars(){
        parser.parseJsonFile{ items in
            self.productData = items
        }
    }
}
