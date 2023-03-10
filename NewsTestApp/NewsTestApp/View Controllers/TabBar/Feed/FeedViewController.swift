//
//  FeedViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    
    let defaultImage = "https://media.istockphoto.com/photos/generic-red-suv-on-a-white-background-side-view-picture-id1157655660?b=1&k=20&m=1157655660&s=612x612&w=0&h=ekNZlV17a3wd_yN9PhHXtIabO_zFo4qipCy2AZRpWUI="

    // test array for parsed data from our API
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // call our task to get data in JSON format from Free NEWs API
        FeedAPIManager.shared.getNews { [weak self] values in
            DispatchQueue.main.async {
                guard let self else { return }
                self.articles = values
                self.table.reloadData()
            }
        }
        // now we have raw data. Access is stable and working.
    
        
        
    }
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        
        let likedArticleIndex = sender.tag
        let tabBar = tabBarController as! TabBarViewController
        
        
        if sender.imageView?.image == UIImage(named: "like") {
            sender.setImage(UIImage(named: "likePressed"), for: .normal)
            print("like button has been pressed")
            print(sender.tag)

            tabBar.savedArticles.append(articles[likedArticleIndex])
            print(tabBar.savedArticles.count)
            
            
            
        } else {
            sender.setImage(UIImage(named: "like"), for: .normal)
            print("dislike button has been pressed")
            print(sender.tag)
            
            tabBar.savedArticles.removeLast()
            print(tabBar.savedArticles.count)
            
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SpecificViewController
        guard let indexPath = table.indexPathForSelectedRow else { return }
        vc.article = articles[indexPath.row]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
         
        // there is need some default image for articles without propper image
        // plus may be i should unwrap image with guard or if else
        cell.bigImageView.loadImage(urlString: articles[indexPath.row].urlToImage ?? defaultImage)
         cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
        cell.likeButton.tag = indexPath.row
        print(cell.likeButton.tag)
        print(cell.likeButton.tag)
        print(cell.likeButton.tag)
        
            
        cell.dateLabel.text = articles[indexPath.row].publishedAt
        cell.articleLabel.text = articles[indexPath.row].title
        cell.articleText.text = articles[indexPath.row].description

        cell.layer.cornerRadius = 20

        return cell
    }
    
    
}
