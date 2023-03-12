//
//  FeedViewController.swift
//  TabBarPractice
//
//  Created by Арсентий Халимовский on 12.03.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    @IBOutlet weak var feedUserLogin: UILabel!
    @IBOutlet weak var feedUserPassword: UILabel!
    
    @IBOutlet weak var feedNumberOfArticles: UILabel!
    
    var numberOfArticles = 0
    
    var feedLogin: String?
    var feedPassword: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        feedUserLogin.text = feedLogin
        feedUserPassword.text = feedPassword
        
        feedNumberOfArticles.text = "\(numberOfArticles)"
    }
    
    
    @IBAction func addArticleButtonPressed(_ sender: Any) {
        numberOfArticles += 1
    }
}
