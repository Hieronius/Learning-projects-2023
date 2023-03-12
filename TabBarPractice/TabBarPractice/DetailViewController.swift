//
//  DetailViewController.swift
//  TabBarPractice
//
//  Created by Арсентий Халимовский on 12.03.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var getArticlesFromFeedFavourite: UILabel!
    
    var numberOfDetailedArticles = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        print("Detail VC has been created")
        getArticlesFromFeedFavourite.text = "\(numberOfDetailedArticles)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getArticlesFromFeedFavourite.text = "\(numberOfDetailedArticles)"
    }
    
    @IBAction func likeArticleButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func dislikeButtonPressed(_ sender: Any) {
    }
}
