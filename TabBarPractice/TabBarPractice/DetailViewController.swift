//
//  DetailViewController.swift
//  TabBarPractice
//
//  Created by Арсентий Халимовский on 12.03.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var getArticlesFromFeedFavourite: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        print("Detail VC has been created")
    }
    
    @IBAction func likeArticleButtonPressed(_ sender: Any) {
    }
    
    @IBAction func dislikeButtonPressed(_ sender: Any) {
    }
}
