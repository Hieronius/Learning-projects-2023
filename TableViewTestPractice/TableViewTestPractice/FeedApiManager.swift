//
//  ApiManager.swift
//  TableViewTestPractice
//
//  Created by Арсентий Халимовский on 25.02.2023.
//

import UIKit

class FeedAPIManager {
    
    static let shared = FeedAPIManager()
    
    let urlString = "https://newsapi.org/v2/everything?q=apple&from=2023-02-26&to=2023-02-26&sortBy=popularity&apiKey=95b0d26c32714d8ab8936e8a9f6f9b84"
    
    
    
}















class Post {

    static let shared = Post()

    let date = "14 февраля"
    let label = "Lorem ipsum dolor sit"
    let text = "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore"
    let mainImage = UIImage(named: "Image")
    let likeImage = UIImage(named: "like")

    func getPost() -> Post {
        let post = Post()
        return post
    }

}
