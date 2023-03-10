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
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(named: "like") {
            sender.imageView?.image = UIImage(named: "likePressed")
        } else {
            sender.imageView?.image = UIImage(named: "like")
        }
    }
    
}
