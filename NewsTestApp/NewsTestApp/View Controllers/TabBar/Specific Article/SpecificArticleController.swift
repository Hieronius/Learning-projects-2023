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
    
    weak var feedViewControllerDelegate: FeedViewControllerDelegate?
    weak var favouriteViewControllerDelegate: FavouriteViewControllerDelegate?
    
    var specificArticleIndex: IndexPath?
    var specificLikeButtonImage: UIImage?
    var specificArticle: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSpecificArticleView()
    }
    
    private func setupSpecificArticleView() {
            specificImageView.layer.cornerRadius = 40
            specificImageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            specificDateLabel.text = specificArticle.publishedAt.formateArticleDate()
            specificArticleLabel.text = specificArticle.title
            specificArticleText.text = specificArticle.content
            specificImageView.loadImage(urlString: specificArticle.urlToImage ?? defaultImage)
            specificLikeButton.setImage(specificLikeButtonImage, for: .normal)
        }
        
    @IBAction func specificLikeButtonPressed(_ sender: UIButton) {
        if sender.imageView?.image == LikeButton.unpressed.image {
            sender.setImage(LikeButton.pressed.image, for: .normal)
            feedViewControllerDelegate?.addToSavedLikedArticle(index: specificArticleIndex!)
            favouriteViewControllerDelegate?.likeArticleAndAddToFavourite(indexOfLikedArticle: specificArticleIndex!, likedArticle: self.specificArticle)
        } else {
            sender.setImage(LikeButton.unpressed.image, for: .normal)
            feedViewControllerDelegate?.removeDislikedArticleFromSaved(index: specificArticleIndex!)
            favouriteViewControllerDelegate?.dislikeArticleAndRemoveFromFavourite(indexOfDislikedArticle: specificArticleIndex!)
        }
    }
}
