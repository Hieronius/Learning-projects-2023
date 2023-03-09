//
//  FavouriteViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

class FavouriteViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var articles: [Article]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath)
        collectionCell.
        return collectionCell
    }
}
