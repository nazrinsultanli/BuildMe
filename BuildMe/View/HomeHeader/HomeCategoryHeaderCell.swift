//
//  HomeCategoryHeaderCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 09.11.23.
//

import UIKit

class HomeCategoryHeaderCell: UICollectionViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpHeader(title:String, image:String){
        categoryLabel.text = "aaa"
        categoryImage.image  = UIImage(named: image)
    }

}
