//
//  ViewController.swift
//  DiceAngelaAppStoryboard
//
//  Created by Арсентий Халимовский on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change of the current image
        diceImageView1.image = UIImage(named: "dice6")
        // change of the current alfa of the image
        diceImageView1.alpha = 0.5
    }


}

