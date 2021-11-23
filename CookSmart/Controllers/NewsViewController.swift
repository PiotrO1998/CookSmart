
import UIKit

/// struct represent NewsViewController object
///
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class NewsViewController: UIViewController {

    
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var source: UILabel!
    
    var news: Newspaper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageNews.contentMode = .scaleToFill
        imageNews.layer.cornerRadius = 5
        
        //additional setup after loading the view.
        imageNews.image = news?.image
        titleNews.text = news?.title
        body.text = "\n" + news!.body
        source.text = "\n" + "source: " + news!.source + "\n"
    }
}
