//
//  FeedViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

protocol FeedViewControllerDelegate: AnyObject {
    func likeArticle(index: IndexPath)
    func dislikeArticle(index: IndexPath)
}

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    weak var tabBarDelegate: TabBarViewControllerDelegate?
    
    // probably this variable can be used as a container for saved articles so i can send it to the Favourite View COntroller and back
    var savedArticles = [Article]()
    
    // var arrayOfLikedButtons = [Int]()
    
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("FeedViewController appeared")
        
        var arrayOfArticlesToChange = [Int]()
        
        for article in articles {
            if !savedArticles.contains(article) {
                arrayOfArticlesToChange.append(articles.firstIndex(of: article)!)
            } else {
                print("there is nothing to fix")
            }
        }
        
        // here we should check our like button in tableView for this articles which have been deleted
        // use array of saved articles to clean it's like buttons if they have been pressed
        for index in arrayOfArticlesToChange {
        
            if let cell = table.cellForRow(at: IndexPath(row: index, section: 0)) as? FeedTableViewCell {
                cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
            }
            
        }
        
    }
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        
        // get access to selected article
        let likedArticleIndex = sender.tag
        let likedArticle = articles[likedArticleIndex]
    
        // add or remove selected articles from savedArticles array
        
        if sender.imageView?.image == UIImage(named: "like") {
            sender.setImage(UIImage(named: "likePressed"), for: .normal)
            print("like button has been pressed")
            print(sender.tag)
            
            
            savedArticles.append(likedArticle)
            print(savedArticles.count)
            
            
            
        } else {
            sender.setImage(UIImage(named: "like"), for: .normal)
            print("dislike button has been pressed")
            print(sender.tag)
            
            
            if let index = savedArticles.firstIndex(of: likedArticle) {
                self.savedArticles.remove(at: index)
                print(savedArticles.count)
                
            }
        }
        
        // save position of the cell with pressed like button
        // arrayOfLikedButtons.append(likedArticleIndex)
        
        // send current array of the articles to favourite
        
        // define tab bar
        let tabBar = self.tabBarController
        
        // check is there is a view controllers or nil
        guard let viewControllers = tabBar?.viewControllers else { return }
        
        // get access to the Navigation View Controller which is connected to the specific ViewController
        for viewController in viewControllers {
            
            if let favouriteNaviVC = viewController as? FavouriteNavigationViewController {
                
                // if our way to the NavigationViewController is succesful let's try to get viewController
                if let favouriteVC = favouriteNaviVC.viewControllers.first as? FavouriteViewController {
                    
                    print("The article has been saved")
                    favouriteVC.articles = self.savedArticles
                    print(favouriteVC.articles.count)
                }
            }
        }
    }
        
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let vc = segue.destination as! SpecificViewController
            guard let indexPath = table.indexPathForSelectedRow else { return }
            vc.article = articles[indexPath.row]
            vc.specificArticleIndex = indexPath
            if let articleCell = table.cellForRow(at: indexPath) as? FeedTableViewCell {
                vc.specificLikeButtonImage = articleCell.likeButton.imageView?.image
            }
            vc.feedVCDelegate = self
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

extension FeedViewController: FeedViewControllerDelegate {
    func likeArticle(index: IndexPath) {
        if let cell = table.cellForRow(at: index) as? FeedTableViewCell {
            cell.likeButton.setImage(UIImage(named: "likePressed"), for: .normal)
            savedArticles.append(articles[index.row])
        }
    }
    
    func dislikeArticle(index: IndexPath) {
        if let cell = table.cellForRow(at: index) as? FeedTableViewCell {
            cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
            
            if let indexOfSavedArticle = savedArticles.firstIndex(of: articles[index.row]) {
                self.savedArticles.remove(at: indexOfSavedArticle)
                
            }
        }
        
    }
}
