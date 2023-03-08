//
//  FeedPost.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 08.03.2023.
//

import UIKit


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
