//
//  HomeCategoryHeaderCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 09.11.23.
//

import UIKit

class HomeCategoryHeaderCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }
    
    func setHomeCategoryData(category: Categories){
        self.categoryLabel.text = category.categoryType?.rawValue
        self.categoryImage.image  = UIImage(named: category.imageName)
    }

    
    func setView(){
        categoryImage.layer.cornerRadius = 15
        categoryImage.layer.borderWidth = 1
        categoryImage.layer.borderColor = UIColor.clear.cgColor
        
      
        
        
    }
}
