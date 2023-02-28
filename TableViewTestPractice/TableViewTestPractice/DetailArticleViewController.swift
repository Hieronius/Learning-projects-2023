//
//  DetailArticleViewController.swift
//  TableViewTestPractice
//
//  Created by Арсентий Халимовский on 28.02.2023.
//

import UIKit

class DetailArticleViewController: UIViewController {
    
    
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleButton: UIButton!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleText: UILabel!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(article?.title)
        
        articleImageView.loadImage(urlString: "\(article?.urlToImage)")
        articleDate.text = article?.publishedAt
        articleTitle.text = article?.title
        articleText.text = article?.description
        articleButton.imageView?.image = UIImage(named: "like")
        
    }
}
