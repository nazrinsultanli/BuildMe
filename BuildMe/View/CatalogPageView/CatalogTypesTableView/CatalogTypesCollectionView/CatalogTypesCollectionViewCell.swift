//
//  CatalogTypesCollectionViewCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class CatalogTypesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backColor: UIView!
    @IBOutlet weak var categoryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    
    }

    func setCatalogCategoryData(category: Categories){
        self.categoryName.text = category.categoryType?.rawValue
    }

    
    func setView(){
        backColor.layer.cornerRadius = 15
        backColor.layer.borderWidth = 1
        backColor.layer.borderColor = UIColor.clear.cgColor
    }
}
