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
        
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("Button got tapped")
        
        // array of all possible dices
        let arrayOfDices = [
            UIImage(named: "dice1"),
            UIImage(named: "dice2"),
            UIImage(named: "dice3"),
            UIImage(named: "dice4"),
            UIImage(named: "dice5"),
            UIImage(named: "dice6")
        ]
        
        // made a random variation of the dices when you press the button "roll
        diceImageView1.image = arrayOfDices[Int.random(in: 0...5)]
        diceImageView2.image = arrayOfDices[Int.random(in: 0...arrayOfDices.count)]
    }
    
}

