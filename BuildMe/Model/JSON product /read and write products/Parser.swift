//
//  Parser.swift
//  MyFoodOrderTask
//
//  Created by Nazrin Sultanlı on 07.10.23.
//

import Foundation
class Parser{
    
    func parseJsonFile (  completion: ( ( [PRODUCTJs] )  ->Void  )  ) {
        if let file = Bundle.main.url(forResource: "PRODUCTJSON", withExtension: "json"){
            
            do{
                let data = try Data(contentsOf: file)
                let items = try JSONDecoder().decode([PRODUCTJs].self, from: data)
                completion(items)
                
            }
            catch{
                print(error.localizedDescription)
            }
            
            
        }
        
    }
    
}
