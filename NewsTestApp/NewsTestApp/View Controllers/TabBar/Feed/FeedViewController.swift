//
//  FeedViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

protocol FeedViewControllerDelegate: AnyObject {
    func addToSavedLikedArticle(index: IndexPath)
    func removeLikedArticleFromSaved(index: IndexPath)
}

class FeedViewController: UIViewController {
    @IBOutlet weak var feedTable: UITableView!
    
    var savedArticles = [Article]()
    var articlesDownloadedFromAPI = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedAPIManager.shared.getNewsFromAPI { [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.articlesDownloadedFromAPI = values
                self.feedTable.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        checkSavedArticlesForRemovedOnesAndUpdateItsLikeButton()
    }
    
    /// When user wan't to go back from Detail article screen back to the News Feed screen this method should check is article has been liked or disliked
    func checkSavedArticlesForRemovedOnesAndUpdateItsLikeButton() {
        var arrayOfArticlesToChange = [Int]()
        for article in articlesDownloadedFromAPI {
            if !savedArticles.contains(article) {
                arrayOfArticlesToChange.append(articlesDownloadedFromAPI.firstIndex(of: article)!)
            }
        }
        for index in arrayOfArticlesToChange {
            if let cell = feedTable.cellForRow(at: IndexPath(row: index, section: 0)) as? FeedTableViewCell {
                cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
            }
        }
    }
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        let likedArticleIndex = sender.tag
        let likedArticle = articlesDownloadedFromAPI[likedArticleIndex]
        if sender.imageView?.image == UIImage(named: "like") {
            sender.setImage(UIImage(named: "likePressed"), for: .normal)
            savedArticles.append(likedArticle)
        } else {
            sender.setImage(UIImage(named: "like"), for: .normal)
            if let index = savedArticles.firstIndex(of: likedArticle) {
                self.savedArticles.remove(at: index)
            }
        }
        matchSavedArticlesWithFavouriteArticles()
    }
    
    func matchSavedArticlesWithFavouriteArticles() {
        let tabBar = self.tabBarController
        guard let viewControllers = tabBar?.viewControllers else { return }
        
        for viewController in viewControllers {
            if let favouriteNaviVC = viewController as? FavouriteNavigationViewController {
                if let favouriteVC = favouriteNaviVC.viewControllers.first as? FavouriteViewController {
                    favouriteVC.favouriteArticles = self.savedArticles
                }
            }
        }
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SpecificViewController
        guard let indexPath = feedTable.indexPathForSelectedRow else { return }
        vc.specificArticle = articlesDownloadedFromAPI[indexPath.row]
        vc.specificArticleIndex = indexPath
        if let articleCell = feedTable.cellForRow(at: indexPath) as? FeedTableViewCell {
            vc.specificLikeButtonImage = articleCell.likeButton.imageView?.image
        }
        vc.feedViewControllerDelegate = self
     }
}

extension FeedViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return articlesDownloadedFromAPI.count
     }
}

extension FeedViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
         cell.bigImageView.loadImage(urlString: articlesDownloadedFromAPI[indexPath.row].urlToImage ?? defaultImage)
         cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
         cell.likeButton.tag = indexPath.row
         cell.dateLabel.text = articlesDownloadedFromAPI[indexPath.row].publishedAt.formateArticleDate()
         cell.articleLabel.text = articlesDownloadedFromAPI[indexPath.row].title
         cell.articleText.text = articlesDownloadedFromAPI[indexPath.row].description
         cell.layer.cornerRadius = 25
         return cell
    }
}

extension FeedViewController: FeedViewControllerDelegate {
    func addToSavedLikedArticle(index: IndexPath) {
        if let cell = feedTable.cellForRow(at: index) as? FeedTableViewCell {
            cell.likeButton.setImage(UIImage(named: "likePressed"), for: .normal)
            savedArticles.append(articlesDownloadedFromAPI[index.row])
            matchSavedArticlesWithFavouriteArticles()
        }
    }
    
    func removeLikedArticleFromSaved(index: IndexPath) {
        if let cell = feedTable.cellForRow(at: index) as? FeedTableViewCell {
            cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
            
            if let indexOfSavedArticle = savedArticles.firstIndex(of: articlesDownloadedFromAPI[index.row]) {
                self.savedArticles.remove(at: indexOfSavedArticle)
            }
            matchSavedArticlesWithFavouriteArticles()
        }
    }
}
