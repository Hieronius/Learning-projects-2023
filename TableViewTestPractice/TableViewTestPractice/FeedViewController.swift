//
//  ViewController.swift
//  TableViewTestPractice
//
//  Created by Арсентий Халимовский on 25.02.2023.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    let urlStringImage = "https://media.istockphoto.com/photos/generic-red-suv-on-a-white-background-side-view-picture-id1157655660?b=1&k=20&m=1157655660&s=612x612&w=0&h=ekNZlV17a3wd_yN9PhHXtIabO_zFo4qipCy2AZRpWUI="

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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // articles.count
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
         
        // there is need some default image for articles without propper image
        // plus may be i should unwrap image with guard or if else
        cell.bigImageView.loadImage(urlString: articles[indexPath.row].urlToImage ?? urlStringImage)
        
        cell.likeButton.imageView?.image = UIImage(named: "likeImage")
        cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
        cell.likeButton.setImage(UIImage(named: "likePressed"), for: .selected)
        cell.dateLabel.text = articles[indexPath.row].publishedAt
        cell.articleLabel.text = articles[indexPath.row].title
        cell.articleText.text = articles[indexPath.row].description

        cell.layer.cornerRadius = 20

        return cell


    }
    
    // Let's work on DetailArticleViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = self.articles[indexPath.row]
        let detailArticleViewController = DetailArticleViewController()
        detailArticleViewController.article = article
        performSegue(withIdentifier: "showDetail", sender: nil)
    }


}

