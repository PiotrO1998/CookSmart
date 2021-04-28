

import UIKit

// class represent IngredientCell
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
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
