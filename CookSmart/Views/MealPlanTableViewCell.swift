//
//  MealPlanTableViewCell.swift
//  CookSmart
//
//  Created by Piotr Obara on 03/05/2022.
//

import UIKit

class MealPlanTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealPlanName: UILabel!
    @IBOutlet weak var mealPlanDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
