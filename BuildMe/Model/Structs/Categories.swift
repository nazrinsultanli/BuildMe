//
//  Category.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 12.11.23.
//

import Foundation
import RealmSwift
class Categories: Object {
    @Persisted var categoryType: CategoryProduct?
    @Persisted var imageName: String
    
    convenience init(categoryType: CategoryProduct?,
                     imageName: String) {
        self.init()
        self.categoryType = categoryType
        self.imageName = imageName
    }
}
