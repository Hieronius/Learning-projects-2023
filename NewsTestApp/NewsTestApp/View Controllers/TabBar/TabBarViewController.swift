//
//  TabBarViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 10.03.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    
    
    var savedArticles =  [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = FavouriteViewController()
        vc.articles = self.savedArticles
    }
}
