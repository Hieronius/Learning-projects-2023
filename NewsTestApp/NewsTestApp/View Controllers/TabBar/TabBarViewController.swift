//
//  TabBarViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 10.03.2023.
//

import UIKit

protocol TabBarViewControllerDelegate: AnyObject {
    func saveArticle(article: Article)
    func removeArticle(article: Article)
}

class TabBarViewController: UITabBarController {

    // may be i should try to use delegation to save data here?
    // so i can use delegation for FeedViewController and in the same moment in Favourite ViewController
    // both of them should affect "savedArticles" array here
    var savedArticles =  [Article]() 
        
    // also may be i should use method "prepare to reach a specific view controller"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let vc = FavouriteViewController()
//        vc.articles = self.savedArticles
//        print("Favourite articles += 1")
        
        let vc = self.tabBarController?.viewControllers?[0] as? FeedViewController
        vc?.testVar = 5
        
        
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let feedVC = segue.destination as? FeedViewController {
            print("there is a feed VC")
            feedVC.tabBarDelegate = self
            
        } else if let specificVC = segue.destination as? SpecificViewController {
            print("there is a specific VC")
        }
    }
}

extension TabBarViewController: TabBarViewControllerDelegate {
    func saveArticle(article: Article) {
        self.savedArticles.append(article)
        print(article.title)
    }
    
    func removeArticle(article: Article) {
        if let index = savedArticles.firstIndex(of: article) {
            self.savedArticles.remove(at: index)
            print(article.title)
        }
    }
}
