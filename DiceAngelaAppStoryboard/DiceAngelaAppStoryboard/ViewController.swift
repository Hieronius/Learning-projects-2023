//
//  ViewController.swift
//  DiceAngelaAppStoryboard
//
//  Created by Арсентий Халимовский on 16.01.2023.
//

import UIKit

class ViewController: UIViewController {

    // outlets for our dices
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change of the current image
        // WHO         WHAT  =   VALUE
        diceImageView1.image = UIImage(named: "dice6")
        
        // change of the current alfa of the image
        diceImageView1.alpha = 0.5
        
        // change of the current image of the second dice
        diceImageView2.image = UIImage(named: "dice2")
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Button got tapped")
    }
    
}

