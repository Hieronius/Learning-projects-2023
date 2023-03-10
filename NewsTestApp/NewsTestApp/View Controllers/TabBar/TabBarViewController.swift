//
//  TabBarViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 10.03.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    // may be i should try to use delegation to save data here?
    // so i can use delegation for FeedViewController and in the same moment in Favourite ViewController
    // both of them should affect "savedArticles" array here
    var savedArticles =  [Article]() 
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = FavouriteViewController()
        vc.articles = self.savedArticles
        print("Favourite articles += 1")
    }
}
