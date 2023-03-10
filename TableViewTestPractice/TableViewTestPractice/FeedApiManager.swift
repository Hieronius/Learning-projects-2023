//
//  ApiManager.swift
//  TableViewTestPractice
//
//  Created by Арсентий Халимовский on 25.02.2023.
//

import UIKit

class FeedAPIManager {
    
    // our singleton of API Manager
    static let shared = FeedAPIManager()
    
    // adress of Free News API in String format
    let urlString = "https://newsapi.org/v2/everything?q=apple&from=2023-02-26&to=2023-02-26&sortBy=popularity&apiKey=95b0d26c32714d8ab8936e8a9f6f9b84"
    
    // we should call this function in ViewController to download some data from Api
    func getNews(completion: @escaping ([Article]) -> Void) {
        // define a real url adress for machine command and create it's entity
        // don't forget to unwrap because there can the adress or can be nothing
        // in this case we sure we have url adress and it's correct
        let url = URL(string: urlString)!
        // set request for machine and create it's entity
        let request = URLRequest(url: url)
        // implement all process into the one task with type of response, data and possible errors:
        // one task can be defined for each of the tabs in internet browser
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // we wan't just check is there a data or not
            guard let data else { return }
            print(data.count)
            // if there is a data let's use JSONDecoder (seems like singletoon too) and decode to what destination and from what source
            // feedData - there is my parsed data, don't forget
            if let feedData = try? JSONDecoder().decode(FeedData.self, from: data) {
                print("Success decoding")
                // MARK: finally i have the data
                print(feedData.articles.count)
                
                // attempt to add my parsed data to an array
                // make "articles" array from FeedData be escaping so we can use it in our table view
                completion(feedData.articles)
                
                
            } else {
                print("Fail")
                print(error)
            }
        }
        // our task is suspended and waiting for activation in our main view controller with viewDidLoad()
        task.resume()
        
    }
    
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
