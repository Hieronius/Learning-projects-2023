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
    
    weak var feedViewControllerDelegate: FeedViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        print("Detail VC has been created")
        getArticlesFromFeedFavourite.text = "\(numberOfDetailedArticles)"
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        getArticlesFromFeedFavourite.text = "\(numberOfDetailedArticles)"
//    }
    
    @IBAction func likeArticleButtonPressed(_ sender: Any) {
        
        numberOfDetailedArticles += 1
//        let feedVC = FeedViewController()
//        feedVC.articlesFromFavourite = self.numberOfDetailedArticles
        self.feedViewControllerDelegate?.saveArticle(article: 1)
        // viewDidAppear(<#T##animated: Bool##Bool#>)
        // print("Now there is - \(feedVC.articlesFromFavourite)")
        viewDidLoad()
    }
    
    @IBAction func dislikeButtonPressed(_ sender: Any) {
        numberOfDetailedArticles -= 1
//         let feedVC = FeedViewController()
//        feedVC.articlesFromFavourite = self.numberOfDetailedArticles
        self.feedViewControllerDelegate?.deleteArticle(article: 1)
        viewDidLoad()
    }
    
}
