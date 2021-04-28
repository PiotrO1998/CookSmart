
import UIKit

// class represent RecipeCell
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
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
