//
//  FeedTableViewCell.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 25.02.2023.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var bigImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var articleText: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    
    // in this method i should add specific article to the favourite view controller
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(named: "like") {
            sender.setImage(UIImage(named: "likePressed"), for: .normal)
            print("like button has been pressed")
            
        } else {
            sender.setImage(UIImage(named: "like"), for: .normal)
            print("dislike button has been pressed")
        }
    }
    
}
