//
//  ViewController.swift
//  TableViewTestPractice
//
//  Created by Арсентий Халимовский on 25.02.2023.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    let urlImage = URL(string: "https://images.app.goo.gl/aJQ56Y5fWRFXgFdm7")
    let urlStringImage = "https://images.app.goo.gl/aJQ56Y5fWRFXgFdm7"
    
    var posts = [Post]()
    // test array for parsed data from our API
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        posts.append(Post.shared.getPost())
//        posts.append(Post.shared.getPost())
//        posts.append(Post.shared.getPost())
//        posts.append(Post.shared.getPost())
//        posts.append(Post.shared.getPost())
//
//        DispatchQueue.main.async {
//            self.table.reloadData()
//        }
        
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // articles.count
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
         // cell.bigImageView.image = UIImage(named: "\(articles[indexPath.row].urlToImage!)")
         // cell.bigImageView.image = UIImage(named: "Image")
        cell.bigImageView.loadImage(urlString: urlStringImage)
        // cell.bigImageView.image = UIImageView.load(url: FeedViewController.urlImage)
         // cell.bigImageView.image = UIImage(imageLiteralResourceName:  "\(articles[indexPath.row].urlToImage!)")
        cell.likeButton.imageView?.image = UIImage(named: "likeImage")
        cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
        cell.likeButton.setImage(UIImage(named: "likePressed"), for: .selected)
        cell.dateLabel.text = articles[indexPath.row].publishedAt
        cell.articleLabel.text = articles[indexPath.row].title
        cell.articleText.text = articles[indexPath.row].description

        cell.layer.cornerRadius = 20

        return cell


    }


}

