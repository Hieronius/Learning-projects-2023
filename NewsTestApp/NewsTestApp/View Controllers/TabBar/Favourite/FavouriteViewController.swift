//
//  FavouriteViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

protocol FavouriteViewControllerDelegate: AnyObject {
    func likeArticle(index: IndexPath, article: Article)
    func dislikeArticle(index: IndexPath)
}

class FavouriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // let favouriteDefaultImage = "https://media.istockphoto.com/photos/generic-red-suv-on-a-white-background-side-view-picture-id1157655660?b=1&k=20&m=1157655660&s=612x612&w=0&h=ekNZlV17a3wd_yN9PhHXtIabO_zFo4qipCy2AZRpWUI="
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        collectionView.reloadData()
        print("Favourite View Controller has been appeared")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SpecificViewController
        guard let indexPath = collectionView.indexPathsForSelectedItems?[0] else { return }
        vc.article = articles[indexPath.row]
        vc.specificArticleIndex = indexPath
        if let collectionCell = collectionView.cellForItem(at: indexPath) as? FavouriteCollectionViewCell {
            vc.specificLikeButtonImage = collectionCell.collectionLikeButton.imageView?.image
        }
        
        // here i should define delegation for specific View COntroller
        vc.favouriteVCDelegate = self
    }

    
    
    @IBAction func favouriteLikeButtonPressed(_ sender: UIButton) {
        
        
        // get access to selected article
        let likedArticleIndex = sender.tag
        let likedArticle = articles[likedArticleIndex]
        
//        let likedArticleIndex = collectionView.indexPathsForSelectedItems!.first
//        let likedArticle = articles[likedArticleIndex!.row]
        
    
        
        // add or remove selected articles from savedArticles array
        
        
        if sender.imageView?.image == UIImage(named: "like") {
            sender.setImage(UIImage(named: "likePressed"), for: .normal)
            print("Favourite like button has been pressed")
            print("article with senderTag - \(sender.tag) has been pressed")
            
            articles.append(likedArticle)
             viewDidAppear(true)
            
        } else {
            
            sender.setImage(UIImage(named: "like"), for: .normal)
            print("Favourite dislike button has been pressed")
            print("article with senderTag - \(sender.tag) has been pressed")
            
            // if there is like button already pressed and we wan't to remove article
            if let index = articles.firstIndex(of: likedArticle) {
                self.articles.remove(at: index)
                print(articles.count)
                viewDidAppear(true)
                
            }
        }
        
        // send current array of the articles to the FeedViewController
        
        // define tab bar
        let tabBar = self.tabBarController
        
        // check is there is a view controllers or nil
        guard let viewControllers = tabBar?.viewControllers else { return }
        
        // get access to the Navigation View Controller which is connected to the specific ViewController
        for viewController in viewControllers {
            
            if let feedNaviVC = viewController as? FeedNavigationViewController {
                
                // if our way to the NavigationViewController is succesful let's try to get viewController
                if let feedVC = feedNaviVC.viewControllers.first as? FeedViewController {
                    
                    print("The article has been saved")
                    feedVC.savedArticles = self.articles
                    print(feedVC.savedArticles.count)
                }
            }
        }
        
    }
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            print(articles.count)
            return articles.count
        }
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! FavouriteCollectionViewCell
            collectionCell.collectionDateLabel.text = articles[indexPath.row].publishedAt
            collectionCell.collectionArticleLabel.text = articles[indexPath.row].title
            collectionCell.collectionImageView.loadImage(urlString: articles[indexPath.row].urlToImage ?? defaultImage)
            collectionCell.collectionLikeButton.setImage(UIImage(named: "likePressed"), for: .normal)
            collectionCell.collectionLikeButton.tag = indexPath.row
            print("collection cell with buttonTag - \(collectionCell.collectionLikeButton.tag)has beed created")
            collectionCell.layer.cornerRadius = 20
            return collectionCell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 164, height: 191)
        }
        
    }

extension FavouriteViewController: FavouriteViewControllerDelegate {
    
    func likeArticle(index: IndexPath, article: Article) {
        if let collectionCell = collectionView.cellForItem(at: index) as? FavouriteCollectionViewCell {
            collectionCell.collectionLikeButton.setImage(UIImage(named: "likePressed"), for: .normal)
            articles.append(article)
            
            
            // probably we can use this chunk of code as a special function like addArticleToSavedArticles
            let tabBar = self.tabBarController
            
            // check is there is a view controllers or nil
            guard let viewControllers = tabBar?.viewControllers else { return }
            
            // get access to the Navigation View Controller which is connected to the specific ViewController
            for viewController in viewControllers {
                
                if let feedNaviVC = viewController as? FeedNavigationViewController {
                    
                    // if our way to the NavigationViewController is succesful let's try to get viewController
                    if let feedVC = feedNaviVC.viewControllers.first as? FeedViewController {
                        
                        print("The article has been saved")
                        feedVC.savedArticles = self.articles
                        print(feedVC.savedArticles.count)
                    }
                }
            }
        }
    }
    
    func dislikeArticle(index: IndexPath) {
        if let collectionCell = collectionView.cellForItem(at: index) as? FavouriteCollectionViewCell {
            collectionCell.collectionLikeButton.setImage(UIImage(named: "like"), for: .normal)
            
            if let indexOfSavedArticle = articles.firstIndex(of: articles[index.row]) {
                self.articles.remove(at: indexOfSavedArticle)
                
            }
            
            let tabBar = self.tabBarController
            
            // check is there is a view controllers or nil
            guard let viewControllers = tabBar?.viewControllers else { return }
            
            // get access to the Navigation View Controller which is connected to the specific ViewController
            for viewController in viewControllers {
                
                if let feedNaviVC = viewController as? FeedNavigationViewController {
                    
                    // if our way to the NavigationViewController is succesful let's try to get viewController
                    if let feedVC = feedNaviVC.viewControllers.first as? FeedViewController {
                        
                        print("The article has been saved")
                        feedVC.savedArticles = self.articles
                        print(feedVC.savedArticles.count)
                    }
                }
            }
        }
        
    }
    
}
    
