//
//  NewspaperViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 24/04/2021.
//

import UIKit

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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.AppNames.newspaperCellIndentifier, for: indexPath) as! NewspaperCell
        
        cell.imageNewspaper.image = newspapers[indexPath.row].image
        cell.title.text = newspapers[indexPath.row].title
        //cell.body.text  = newspapers[indexPath.row].body
        //cell.source.text = newspapers[indexPath.row].source
        
        return cell
    }
    
    

}

extension NewspaperViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "NewsViewController") as! NewsViewController
        vc.news = newspapers[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}



