//
//  FeedAPIManager.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 25.02.2023.
//

import UIKit

class Post {
    
    static let shared = Post()
    
    let date = "14 февраля"
    let label = "Название"
    let text = "Тут вы можете прочесть подробное описание"
    let image = UIImage(named: "testImage")
    let smallImage = UIImage(named: "emptyLike")
    var isLiked = false
    
    // here should be func to add data into the post from API

    func getPost() -> Post {
        let post = Post()
        return post
    }

}

