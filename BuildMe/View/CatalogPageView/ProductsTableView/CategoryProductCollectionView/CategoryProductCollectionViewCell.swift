//
//  CategoryProductCollectionViewCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class CategoryProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var backViewColor: UIView!
    @IBOutlet weak var modelNAme: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }
    
    
    func setCatalogProduct (product: Product){
        //savedBookmark.isHidden = true
        self.modelNAme.text = product.modelName?.rawValue
        self.price.text = product.brandName?.rawValue
        self.image.image = UIImage(named: product.imageName)
    }

    func setView(){
        image.layer.cornerRadius = 15
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.clear.cgColor
        
        backViewColor.layer.cornerRadius = 15
        backViewColor.layer.borderWidth = 1
        backViewColor.layer.borderColor = UIColor.clear.cgColor
        
        
    }

}
