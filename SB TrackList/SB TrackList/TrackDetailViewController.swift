//
//  TrackDetailViewController.swift
//  SB TrackList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//

import UIKit

class TrackDetailViewController: UIViewController {
    
    
    @IBOutlet weak var musicImageView: UIImageView!
    
    @IBOutlet weak var musicTitle: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        musicImageView.image = UIImage(named: track.track)
        musicTitle.text = track.track
    }
}
