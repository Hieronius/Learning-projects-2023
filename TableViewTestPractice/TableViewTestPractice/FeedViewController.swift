//
//  ViewController.swift
//  TableViewTestPractice
//
//  Created by Арсентий Халимовский on 25.02.2023.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        cell.bigImageView.image = posts[indexPath.row].mainImage
        // cell.likeButton.image = posts[indexPath.row].likeImage
        // cell.likeButton.image(for: UIControl.State.)
        cell.likeButton.imageView?.image = posts[indexPath.row].likeImage
        cell.likeButton.setImage(UIImage(named: "like"), for: .normal)
        cell.likeButton.setImage(UIImage(named: "likePressed"), for: .selected)
        cell.dateLabel.text = posts[indexPath.row].date
        cell.articleLabel.text = posts[indexPath.row].label
        cell.articleText.text = posts[indexPath.row].text
        
        cell.layer.cornerRadius = 20
        
        return cell
        
        
    }


}

