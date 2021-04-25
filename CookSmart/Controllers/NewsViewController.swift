//
//  NewsViewController.swift
//  CookSmart
//
//  Created by Piotr Obara on 5/04/2021.
//
//Class Represent Particular News View

import UIKit

class NewsViewController: UIViewController {

    
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var source: UILabel!
    
    var news: Newspaper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageNews.contentMode = .scaleToFill
        
        //additional setup after loading the view.
        imageNews.image = news?.image
        titleNews.text = news?.title
        body.text = "\n" + news!.body
        source.text = "\n" + "source:" + news!.source + "\n"
    }
}
