//
//  IngredientCell.swift
//  CookSmart
//
//  Created by Piotr Obara on 25/04/2021.
//

import UIKit

class IngredientCell: UITableViewCell {
    
    @IBOutlet weak var circle: UIImageView!
    @IBOutlet weak var ingredientName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
