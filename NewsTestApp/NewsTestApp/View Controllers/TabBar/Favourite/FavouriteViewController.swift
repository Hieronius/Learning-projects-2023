//
//  FavouriteViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

protocol FavouriteViewControllerDelegate: AnyObject {
    func likeArticle(indexOfLikedArticle: IndexPath, likedArticle: Article)
    func dislikeArticle(indexOfDislikedArticle: IndexPath)
}

class FavouriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var favouriteCollectionView: UICollectionView!
    
    var favouriteArticles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favouriteCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        favouriteCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let specificViewController = segue.destination as! SpecificViewController
        guard let indexPath = favouriteCollectionView.indexPathsForSelectedItems?[0] else { return }
        
        specificViewController.specificArticle = favouriteArticles[indexPath.row]
        specificViewController.specificArticleIndex = indexPath
        if let favouriteCollectionCell = favouriteCollectionView.cellForItem(at: indexPath) as? FavouriteCollectionViewCell {
            specificViewController.specificLikeButtonImage = favouriteCollectionCell.favouriteCollectionLikeButton.imageView?.image
        }
        
        // here i should define delegation for specific View COntroller
        specificViewController.favouriteVCDelegate = self
    }

    
    
    @IBAction func favouriteLikeButtonPressed(_ sender: UIButton) {
        
        
        // get access to selected article
        let likedArticleIndex = sender.tag
        let likedArticle = favouriteArticles[likedArticleIndex]
        
//        let likedArticleIndex = collectionView.indexPathsForSelectedItems!.first
//        let likedArticle = articles[likedArticleIndex!.row]
        
    
        
        // add or remove selected articles from savedArticles array
        
        
        if sender.imageView?.image == UIImage(named: "like") {
            sender.setImage(UIImage(named: "likePressed"), for: .normal)
            print("Favourite like button has been pressed")
            print("article with senderTag - \(sender.tag) has been pressed")
            
            favouriteArticles.append(likedArticle)
             viewDidAppear(true)
            
        } else {
            
            sender.setImage(UIImage(named: "like"), for: .normal)
            print("Favourite dislike button has been pressed")
            print("article with senderTag - \(sender.tag) has been pressed")
            
            // if there is like button already pressed and we wan't to remove article
            if let index = favouriteArticles.firstIndex(of: likedArticle) {
                self.favouriteArticles.remove(at: index)
                print(favouriteArticles.count)
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
                    feedVC.savedArticles = self.favouriteArticles
                    print(feedVC.savedArticles.count)
                }
            }
        }
        
    }
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            print(favouriteArticles.count)
            return favouriteArticles.count
        }
        
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! FavouriteCollectionViewCell
            collectionCell.favouriteCollectionDateLabel.text = favouriteArticles[indexPath.row].publishedAt
            collectionCell.favouriteCollectionArticleLabel.text = favouriteArticles[indexPath.row].title
            collectionCell.favouriteCollectionImageView.loadImage(urlString: favouriteArticles[indexPath.row].urlToImage ?? defaultImage)
            collectionCell.favouriteCollectionLikeButton.setImage(UIImage(named: "likePressed"), for: .normal)
            collectionCell.favouriteCollectionLikeButton.tag = indexPath.row
            print("collection cell with buttonTag - \(collectionCell.favouriteCollectionLikeButton.tag)has beed created")
            collectionCell.layer.cornerRadius = 20
            return collectionCell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 164, height: 191)
        }
        
    }

extension FavouriteViewController: FavouriteViewControllerDelegate {
    
    func likeArticle(indexOfLikedArticle: IndexPath, likedArticle: Article) {
        if let collectionCell = favouriteCollectionView.cellForItem(at: indexOfLikedArticle) as? FavouriteCollectionViewCell {
            collectionCell.favouriteCollectionLikeButton.setImage(UIImage(named: "likePressed"), for: .normal)
            favouriteArticles.append(likedArticle)
            
            
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
                        feedVC.savedArticles = self.favouriteArticles
                        print(feedVC.savedArticles.count)
                    }
                }
            }
        }
    }
    
    func dislikeArticle(indexOfDislikedArticle: IndexPath) {
        if let collectionCell = favouriteCollectionView.cellForItem(at: indexOfDislikedArticle) as? FavouriteCollectionViewCell {
            collectionCell.favouriteCollectionLikeButton.setImage(UIImage(named: "like"), for: .normal)
            
            if let indexOfSavedArticle = favouriteArticles.firstIndex(of: favouriteArticles[indexOfDislikedArticle.row]) {
                self.favouriteArticles.remove(at: indexOfSavedArticle)
                
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
                        feedVC.savedArticles = self.favouriteArticles
                        print(feedVC.savedArticles.count)
                    }
                }
            }
        }
        
    }
    
}
    
