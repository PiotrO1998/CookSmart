
import UIKit

/// class represent MealCell
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class MealCell: UITableViewCell {
    
    @IBOutlet weak var imageMeal: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageMeal.contentMode = .scaleToFill
        imageMeal.layer.cornerRadius = 15
        
        name.contentMode = .scaleToFill
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
