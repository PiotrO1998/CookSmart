

import UIKit

// class represent NewspaperCell
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class NewspaperCell: UITableViewCell {
    
    @IBOutlet weak var imageNewspaper: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var source: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        imageNewspaper.contentMode = .scaleToFill
        //imageNewspaper.layer.cornerRadius = 5
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
