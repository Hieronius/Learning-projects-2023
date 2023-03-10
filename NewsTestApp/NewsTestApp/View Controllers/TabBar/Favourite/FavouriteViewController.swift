//
//  FavouriteViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

class FavouriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var articles: [Article]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    
    @IBAction func favouriteLikeButtonPressed(_ sender: UIButton) {
        if sender.imageView?.image == UIImage(named: "like") {
            sender.setImage(UIImage(named: "likePressed"), for: .normal)
            print("like button has been pressed")
            
        } else {
            sender.setImage(UIImage(named: "like"), for: .normal)
            print("dislike button has been pressed")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("10 items have been created")
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! FavouriteCollectionViewCell
        collectionCell.collectionDateLabel.text = "14 february"
        collectionCell.collectionArticleLabel.text = "Lorem ipsum dolor sit amet."
         collectionCell.collectionImageView.image = UIImage(named: "Image")
         collectionCell.collectionLikeButton.setImage(UIImage(named: "likePressed"), for: .normal)
        print("cell has beed created")
        collectionCell.layer.cornerRadius = 20
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 191)
    }
    
}


