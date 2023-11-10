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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
