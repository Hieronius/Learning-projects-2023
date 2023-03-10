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
    
    
    
    let specificDefaultImage = "https://media.istockphoto.com/photos/generic-red-suv-on-a-white-background-side-view-picture-id1157655660?b=1&k=20&m=1157655660&s=612x612&w=0&h=ekNZlV17a3wd_yN9PhHXtIabO_zFo4qipCy2AZRpWUI="
    
    // data for our specificViewController
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        specificImageView.layer.cornerRadius = 40
        specificImageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        
        specificDateLabel.text = article.publishedAt
        specificArticleLabel.text = article.title
        specificArticleText.text = article.content
        specificImageView.loadImage(urlString: article.urlToImage ?? specificDefaultImage)
        // specificLikeButton.setImage(UIImage(named: "like"), for: .normal)
        }
    
    
    @IBAction func specificLikeButtonPressed(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(named: "like") {
            sender.setImage(UIImage(named: "likePressed"), for: .normal)
            print("button has been pressed")
            
        } else {
            sender.setImage(UIImage(named: "like"), for: .normal)
            print("button has been pressed")
        }
    }
}
