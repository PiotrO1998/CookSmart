//
//  RecipeCell.swift
//  CookSmart
//
//  Created by Piotr Obara on 15/04/2021.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recipeImage.contentMode = .scaleToFill
        //recipeImage.layer.cornerRadius = 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
