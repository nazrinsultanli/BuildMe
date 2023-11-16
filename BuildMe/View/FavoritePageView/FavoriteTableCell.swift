//
//  FavoriteTableCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class FavoriteTableCell: UITableViewCell {

    @IBOutlet weak var imageName: UIImageView!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var brandName: UILabel!
    
    @IBOutlet weak var modelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setFavTable(product:Product){
        imageName.image = UIImage(named: product.imageName)
        price.text = "\(product.price) AZN"
        brandName.text = product.brandName?.rawValue
        modelName.text = product.modelName?.rawValue
    }
    
}
