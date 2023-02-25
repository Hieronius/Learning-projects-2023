//
//  ApiManager.swift
//  TableViewTestPractice
//
//  Created by Арсентий Халимовский on 25.02.2023.
//

import UIKit

class Post {
    
    static let shared = Post()
    
    let date = "14 февраля"
    let label = "Название статьи"
    let text = "Текст статьи"
    let mainImage = UIImage(named: "bigImage")
    let smallImage = UIImage(named: "smallImage")
    
    func getPost() -> Post {
        let post = Post()
        return post
    }
    
}
