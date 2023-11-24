//
//  ProductJsFileManager.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 21.11.23.
//

import Foundation
class ProductJsFileManager{
    func getFilePath() -> URL{
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("productLocal.json")
        //print(path)
        return path
    }
    
    func readData(complete:( ([PRODUCTJs]) -> Void )  ) {
        if let data = try? Data(contentsOf: getFilePath()){
            do {
                let items = try JSONDecoder().decode([PRODUCTJs].self, from: data)
                complete(items)
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func writeData(product: [PRODUCTJs]){
        do {
            let data = try JSONEncoder().encode(product)
            try data.write(to:getFilePath())
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
