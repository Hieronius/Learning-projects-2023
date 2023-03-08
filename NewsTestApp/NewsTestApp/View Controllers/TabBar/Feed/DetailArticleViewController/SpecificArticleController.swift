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
    
    // data for our specificViewController
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        specificDateLabel.text = post.date
        specificArticleLabel.text = post.label
        specificArticleText.text = post.text
        specificImageView.image = post.mainImage
        specificLikeButton.imageView?.image = post.likeImage
    }
}
