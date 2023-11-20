//
//  FileManagerHelper.swift
//  MyBankApp
//
//  Created by Nazrin Sultanlı on 14.10.23.
//

import Foundation

class FavoriteJsManagerHelper{
    
    
    
    func getFilePath() -> URL{
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("favorites.json")
        
        print(path)
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
    
    func writeData(favProduct: [PRODUCTJs]){
        do {
            let data = try JSONEncoder().encode(favProduct)
            try data.write(to:getFilePath())
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
