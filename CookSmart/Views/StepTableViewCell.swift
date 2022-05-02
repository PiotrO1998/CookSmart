//
//  StepTableViewCell.swift
//  CookSmart
//
//  Created by Piotr Obara on 02/05/2022.
//

import UIKit

class StepTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
