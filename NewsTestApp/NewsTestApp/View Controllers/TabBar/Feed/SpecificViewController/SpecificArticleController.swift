//
//  SpecificArticleController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 08.03.2023.
//

import UIKit

class SpecificViewController: UIViewController {
    @IBOutlet weak var specificImageView: UIImageView!
    @IBOutlet weak var specificDateLabel: UILabel!
    @IBOutlet weak var specificLikeButton: UIButton!
    @IBOutlet weak var specificArticleLabel: UILabel!
    @IBOutlet weak var specificArticleText: UILabel!
    @IBOutlet weak var specificView: UIView!
    
    // rename here
    weak var feedVCDelegate: FeedViewControllerDelegate?
    weak var favouriteVCDelegate: FavouriteViewControllerDelegate?
    
    var specificArticleIndex: IndexPath?
    var specificLikeButtonImage: UIImage?
    var specificArticle: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSpecificArticleView()
    }
    
        func setupSpecificArticleView() {
            specificImageView.layer.cornerRadius = 40
            specificImageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            specificDateLabel.text = specificArticle.publishedAt.formateArticleDate()
            specificArticleLabel.text = specificArticle.title
            specificArticleText.text = specificArticle.content
            specificImageView.loadImage(urlString: specificArticle.urlToImage ?? defaultImage)
            specificLikeButton.setImage(specificLikeButtonImage, for: .normal)
        }
        
        @IBAction func specificLikeButtonPressed(_ sender: UIButton) {
            if sender.imageView?.image == UIImage(named: "like") {
                sender.setImage(UIImage(named: "likePressed"), for: .normal)
                feedVCDelegate?.addToSavedLikedArticle(index: specificArticleIndex!)
                favouriteVCDelegate?.likeArticleAndAddToFavourite(indexOfLikedArticle: specificArticleIndex!, likedArticle: self.specificArticle)
            } else {
                sender.setImage(UIImage(named: "like"), for: .normal)
                feedVCDelegate?.removeLikedArticleFromSaved(index: specificArticleIndex!)
                favouriteVCDelegate?.dislikeArticleAndRemoveFromFavourite(indexOfDislikedArticle: specificArticleIndex!)
            }
        }
    }
