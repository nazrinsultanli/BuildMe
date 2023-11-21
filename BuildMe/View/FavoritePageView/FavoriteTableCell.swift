//
//  FavoriteTableCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class FavoriteTableCell: UITableViewCell {

    @IBOutlet weak var addToBasketButton: UIButton!
    @IBOutlet weak var imageName: UIImageView!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var brandName: UILabel!
    
    @IBOutlet weak var modelName: UILabel!
    
    var basketButtonClicked: ((Int, String)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setFavTable(product:PRODUCTJs){
        imageName.image = UIImage(named: product.imageName)
        price.text = "\(product.price) AZN"
        brandName.text = product.brandName
        modelName.text = product.modelName
    }
    
    @IBAction func addToBasketClicked(_ sender: Any) {
        basketButtonClicked?(tag, "")
        
    }
    
}


