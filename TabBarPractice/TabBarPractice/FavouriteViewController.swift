//
//  FavouriteViewController.swift
//  TabBarPractice
//
//  Created by Арсентий Халимовский on 12.03.2023.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    @IBOutlet weak var favouriteNumberOfArticles: UILabel!
    
    
    @IBOutlet weak var getArticlesFromFeed: UILabel!
    
    var articlesFromFeed = 0 {
        didSet {
            getArticlesFromFeed.text = "\(articlesFromFeed)"
        }
    }
    
    var numberOfSavedArticles = 0 {
        didSet {
            favouriteNumberOfArticles.text = "\(numberOfSavedArticles)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        favouriteNumberOfArticles.text = "\(numberOfSavedArticles)"
        getArticlesFromFeed.text = "\(articlesFromFeed)"
    }
    
    
    
    @IBAction func saveArticleButtonPressed(_ sender: Any) {
        numberOfSavedArticles += 1
        articlesFromFeed += 1
    }
}
