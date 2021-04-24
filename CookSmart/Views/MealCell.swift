//
//  MealCell.swift
//  CookSmart
//
//  Created by Piotr Obara on 24/04/2021.
//

import UIKit

class MealCell: UITableViewCell {
    
    @IBOutlet weak var imageMeal: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageMeal.contentMode = .scaleToFill
        imageMeal.layer.cornerRadius = 15
        
        name.contentMode = .scaleToFill
        //label.layer.cornerRadius = 15
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
