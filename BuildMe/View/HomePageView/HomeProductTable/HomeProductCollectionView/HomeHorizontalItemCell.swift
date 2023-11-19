//
//  HomeHorizontalItemCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 10.11.23.
//

import UIKit

class HomeHorizontalItemCell: UICollectionViewCell {
    @IBOutlet weak var backViewColor: UIView!
    
    @IBOutlet weak var stars: UIImageView!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var savedBookmark: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }
    
    func setHomeProductData (product: PRODUCTJs){
        savedBookmark.isHidden = true
        self.modelName.text = product.modelName
        self.brandName.text = product.brandName
        self.imageView.image = UIImage(named: product.imageName)
    }

    func setView(){
        imageView.layer.cornerRadius = 15
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.clear.cgColor
        
        backViewColor.layer.cornerRadius = 15
        backViewColor.layer.borderWidth = 1
        backViewColor.layer.borderColor = UIColor.clear.cgColor
        
        
    }
}
