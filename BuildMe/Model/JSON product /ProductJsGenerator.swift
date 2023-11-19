//
//  FileManagerHelper.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 11.10.23.
//

import Foundation


class ProductJsGenerator {
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
