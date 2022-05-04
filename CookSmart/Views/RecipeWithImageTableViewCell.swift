//
//  RecipeWithImageTableViewCell.swift
//  CookSmart
//
//  Created by Piotr Obara on 03/05/2022.
//

import UIKit

class RecipeWithImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeCookTime: UILabel!
    @IBOutlet weak var recipeLevel: UILabel!
    
    @IBOutlet weak var circle: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
