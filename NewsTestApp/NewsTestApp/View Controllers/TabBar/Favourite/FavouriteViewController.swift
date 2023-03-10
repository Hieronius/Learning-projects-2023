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
        
        // some code here
//        collectionView.dataSource = self
//        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
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
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 164, height: 191)
    }
    
}


