//
//  Product.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 10.11.23.
//
import Foundation
import RealmSwift

class Product: Object{
    @Persisted var categoryType: CategoryProduct?
    @Persisted var brandName: BrandProduct?
    @Persisted var modelName: ModelProduct?
    @Persisted var modelCode: String
    @Persisted var price: Double
    @Persisted var quantity: Int
    @Persisted var stock: Bool
    @Persisted var rating: Int
    @Persisted var imageName: String
    @Persisted var definition: String
    @Persisted var featured: Bool
    @Persisted var discounted: Bool
    @Persisted var new: Bool
    @Persisted var favorited: Bool
    
    convenience init(categoryType: CategoryProduct?,
                     brandName: BrandProduct?,
                     modelName: ModelProduct?,
                     modelCode: String,
                     price: Double,
                     quantity: Int,
                     stock: Bool,
                     rating: Int,
                     imageName: String,
                     definition: String, 
                     featured: Bool,
                     discounted: Bool,
                     new: Bool,
                     favorited: Bool) {
        self.init()
        self.categoryType = categoryType
        self.brandName = brandName
        self.modelName = modelName
        self.modelCode = modelCode
        self.price = price
        self.quantity = quantity
        self.stock = stock
        self.rating = rating
        self.imageName = imageName
        self.definition = definition
        self.featured = featured
        self.discounted = discounted
        self.new = new
        self.favorited = favorited
  
    }
}


enum CategoryProduct: String, CaseIterable, PersistableEnum {
    case laminate = "Laminate"
    case ceramics = "Ceramics"
    case asmaTavan =  "AsmaTavan"
    case accesories = "Accesories"
    case kafel = "Kafel"
}

enum BrandProduct: String, CaseIterable, PersistableEnum {
    case swiss = "Swiss"
    case krono = "Krono"
    case ceramika = "My Keramics"
    case tavan =  "Tavan As"
    case accesor = "Accesor me"
    case kafell = "Kafelier"
}




enum ModelProduct: String, CaseIterable, PersistableEnum {
    case swiss1 = "Sw0001"
    case swiss2 = "Sw0002"
    case krono1 = "Kr0001"
    case krono2 = "Kr0002"
    case ceramika1 = "MK0001"
    case ceramika2 = "MK0002"
    case tavan1 =  "TA0001"
    case tavan2 =  "TA0002"
    case accesor1 = "AM0001"
    case accesor2 = "AM0002"
    case kafell1 = "KA0001"
    case kafell2 = "KA0002"
}

