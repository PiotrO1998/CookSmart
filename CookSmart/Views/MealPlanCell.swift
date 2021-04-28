
import UIKit

// class represent MealPlanCell
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class MealPlanCell: UITableViewCell {
    
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageMiddle: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    
    @IBOutlet weak var nameLeft: UILabel!
    @IBOutlet weak var nameMiddle: UILabel!
    @IBOutlet weak var nameRight: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageLeft.contentMode = .scaleToFill
        imageLeft.layer.cornerRadius = 5
        
        imageMiddle.contentMode = .scaleToFill
        imageMiddle.layer.cornerRadius = 5
        
        imageRight.contentMode = .scaleToFill
        imageRight.layer.cornerRadius = 5
        
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
