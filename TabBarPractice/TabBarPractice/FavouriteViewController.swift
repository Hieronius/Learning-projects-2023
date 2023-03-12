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
    
//    var articlesFromFeed: Int = 0 {
//        didSet {
//            getArticlesFromFeed.text = "\(articlesFromFeed)"
//        }
//    }
    
      var articlesFromFeed = 0
//    
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
        print("get articles has been created")
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        getArticlesFromFeed.text = "\(articlesFromFeed)"
//    }
    
    
    
    @IBAction func saveArticleButtonPressed(_ sender: Any) {
        numberOfSavedArticles += 1
        articlesFromFeed -= 1
        
        let tabBar = self.tabBarController
        guard let viewControllers = tabBar?.viewControllers else { return }
        
        for viewController in viewControllers {
            
            if let feedNaviVC = viewController as? FeedNavigationViewController {
                
                if let feedViewController = feedNaviVC.viewControllers.first as? FeedViewController {
                    feedViewController.articlesFromFavourite = self.articlesFromFeed
                    print("data has been sended")
                    print(feedViewController.articlesFromFavourite)
                }
            }
        }
//        viewDidLoad()
//        viewDidAppear(true)
        viewDidLoad()
    }
}
