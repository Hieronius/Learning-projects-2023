//
//  ViewController.swift
//  StoryTeller
//
//  Created by Арсентий Халимовский on 29.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // list of our elements on storyboard:
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // action that happen when we press the buttons:
    @IBAction func pressButtons(_ sender: Any) {
    }
}

