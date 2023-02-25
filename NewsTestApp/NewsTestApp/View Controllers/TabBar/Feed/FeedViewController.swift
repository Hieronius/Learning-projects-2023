//
//  FeedViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var table: UITableView!
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        posts.append(Post.shared.getPost())
        posts.append(Post.shared.getPost())
        posts.append(Post.shared.getPost())
        posts.append(Post.shared.getPost())
        posts.append(Post.shared.getPost())
        
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedTableViewCell
        cell.dateLabel.text = posts[indexPath.row].date
        cell.articleLabel.text = posts[indexPath.row].label
        cell.articleTextLabel.text = posts[indexPath.row].text
        cell.mainImageView.image = posts[indexPath.row].image
        cell.likeImageView.image = posts[indexPath.row].smallImage
        return cell
    }
}
