//
//  FavouriteViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

protocol FavouriteViewControllerDelegate: AnyObject {
    func likeArticleAndAddToFavourite(indexOfLikedArticle: IndexPath, likedArticle: Article)
    func dislikeArticleAndRemoveFromFavourite(indexOfDislikedArticle: IndexPath)
}

class FavouriteViewController: UIViewController {
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
        specificViewController.favouriteViewControllerDelegate = self
    }

    @IBAction func favouriteLikeButtonPressed(_ sender: UIButton) {
        let likedArticleIndex = sender.tag
        let likedArticle = favouriteArticles[likedArticleIndex]
        
        if sender.imageView?.image == UIImage(named: "like") {
            sender.setImage(UIImage(named: "likePressed"), for: .normal)
            favouriteArticles.append(likedArticle)
            viewDidAppear(true)
        } else {
            sender.setImage(UIImage(named: "like"), for: .normal)
            
            if let index = favouriteArticles.firstIndex(of: likedArticle) {
                self.favouriteArticles.remove(at: index)
                viewDidAppear(true)
            }
        }
        matchFavouriteArticlesWithSavedArticles()
    }
    
    func matchFavouriteArticlesWithSavedArticles() {
        let tabBar = self.tabBarController
        guard let viewControllers = tabBar?.viewControllers else { return }
        
        for viewController in viewControllers {
            if let feedNavigationViewController = viewController as? FeedNavigationViewController {
                if let feedViewController = feedNavigationViewController.viewControllers.first as? FeedViewController {
                    feedViewController.savedArticles = self.favouriteArticles
                    print("current number of saved articles - \(feedViewController.savedArticles.count)")
                }
            }
        }
    }
}

extension FavouriteViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return favouriteArticles.count
    }
}

extension FavouriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! FavouriteCollectionViewCell
        collectionCell.favouriteCollectionDateLabel.text = favouriteArticles[indexPath.row].publishedAt.formateArticleDate()
            collectionCell.favouriteCollectionArticleLabel.text = favouriteArticles[indexPath.row].title
            collectionCell.favouriteCollectionImageView.loadImage(urlString: favouriteArticles[indexPath.row].urlToImage ?? defaultImage)
            collectionCell.favouriteCollectionLikeButton.setImage(UIImage(named: "likePressed"), for: .normal)
            collectionCell.favouriteCollectionLikeButton.tag = indexPath.row
            collectionCell.layer.cornerRadius = 20
            return collectionCell
    }
}

extension FavouriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 164, height: 191)
    }
}

extension FavouriteViewController: FavouriteViewControllerDelegate {
    func likeArticleAndAddToFavourite(indexOfLikedArticle: IndexPath, likedArticle: Article) {
        if let collectionCell = favouriteCollectionView.cellForItem(at: indexOfLikedArticle) as? FavouriteCollectionViewCell {
            collectionCell.favouriteCollectionLikeButton.setImage(UIImage(named: "likePressed"), for: .normal)
            favouriteArticles.append(likedArticle)
            
            matchFavouriteArticlesWithSavedArticles()
        }
    }
    
    func dislikeArticleAndRemoveFromFavourite(indexOfDislikedArticle: IndexPath) {
        if let collectionCell = favouriteCollectionView.cellForItem(at: indexOfDislikedArticle) as? FavouriteCollectionViewCell {
            collectionCell.favouriteCollectionLikeButton.setImage(UIImage(named: "like"), for: .normal)
            if let indexOfSavedArticle = favouriteArticles.firstIndex(of: favouriteArticles[indexOfDislikedArticle.row]) {
                self.favouriteArticles.remove(at: indexOfSavedArticle)
            }
            matchFavouriteArticlesWithSavedArticles()
        }
    }
}
    
