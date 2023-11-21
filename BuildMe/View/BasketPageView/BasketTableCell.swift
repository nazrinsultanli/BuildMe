//
//  BasketTableCell.swift
//  BuildMe
//
//  Created by Nazrin Sultanlı on 11.11.23.
//

import UIKit

class BasketTableCell: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setBasketTable(product:PRODUCTJs){
        myImage.image = UIImage(named: product.imageName)
        price.text = "\(product.price) AZN"
        brandName.text = product.brandName
        modelName.text = product.modelName
        quantity.text = "Order: \(product.order)"
    }
    
}
