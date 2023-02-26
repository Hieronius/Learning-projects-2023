//
//  ApiManager.swift
//  TableViewTestPractice
//
//  Created by Арсентий Халимовский on 25.02.2023.
//

import UIKit

final class APICaller {
    
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadLinesURL = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2023-02-25&to=2023-02-25&sortBy=popularity&apiKey=95b0d26c32714d8ab8936e8a9f6f9b84")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = Constants.topHeadLinesURL else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    
                    print("Articles: \(result.articles.count)")
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

// Models

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
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
