//
//  FeedViewController.swift
//  TabBarPractice
//
//  Created by Арсентий Халимовский on 12.03.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    @IBOutlet weak var feedUserLogin: UILabel!
    @IBOutlet weak var feedUserPassword: UILabel!
    
    @IBOutlet weak var feedNumberOfArticles: UILabel!
    
    
    @IBOutlet weak var getArticlesFromFavourite: UILabel!
    
    var articlesFromFavourite = 0 {
        didSet {
            getArticlesFromFavourite.text = "\(articlesFromFavourite)"
        }
    }
    
    var numberOfArticles = 0 {
        didSet {
            feedNumberOfArticles.text = "\(numberOfArticles)"
        }
        
    }
    
    var feedLogin: String?
    var feedPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        feedUserLogin.text = feedLogin
        feedUserPassword.text = feedPassword
        
        feedNumberOfArticles.text = "\(numberOfArticles)"
        getArticlesFromFavourite.text = "\(articlesFromFavourite)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBar = tabBarController
        guard let viewControllers = tabBar?.viewControllers else { return }
        
        for viewController in viewControllers {
            
            if let favourNaviVC = viewController as? FavouriteNavigationViewController {
                
                if let favouriteViewController = favourNaviVC.viewControllers.first as? FavouriteViewController {
                    favouriteViewController.articlesFromFeed = articlesFromFavourite
                }
            }
        }
    }
    
    
    @IBAction func addArticleButtonPressed(_ sender: Any) {
        self.numberOfArticles += 1
    }
}
