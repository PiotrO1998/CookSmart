
import UIKit

/// class represent NewspaperViewController object
///
///
///  - Author: Piotr Obara
///  - Version: 1.0
///
class NewspaperViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let newspaperData: NewspaperData = NewspaperData()
    var newspapers: [Newspaper] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        newspapers = newspaperData.newspapers
        
        //Register Table View
        tableView.register(UINib(nibName: Constants.AppNames.newspaperCellNibName, bundle: nil), forCellReuseIdentifier: Constants.AppNames.newspaperCellIndentifier)
    }
}

extension NewspaperViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newspapers.count
    }
    
    ///Delegate method that populate table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.newspaperCellIndentifier, for: indexPath) as! NewspaperCell
        
        cell.imageNewspaper.image = newspapers[indexPath.row].image
        cell.title.text = newspapers[indexPath.row].title
        return cell
    }
}


extension NewspaperViewController: UITableViewDelegate {
    ///Delegate method that managed action when user click table view cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
        vc.news = newspapers[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}



