
import UIKit

// class represent SavedMealPlanCell
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class SavedMealPlanCell: UITableViewCell {
    
    @IBOutlet weak var imageLeft: UIImageView!
    @IBOutlet weak var imageMiddle: UIImageView!
    @IBOutlet weak var imageRight: UIImageView!
    @IBOutlet weak var nameLeft: UILabel!
    @IBOutlet weak var nameMiddle: UILabel!
    @IBOutlet weak var nameRight: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        imageLeft.contentMode = .scaleToFill
        imageLeft.layer.cornerRadius = 5
        
        imageMiddle.contentMode = .scaleToFill
        imageMiddle.layer.cornerRadius = 5
        
        imageRight.contentMode = .scaleToFill
        imageRight.layer.cornerRadius = 5
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
