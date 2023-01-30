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
    
    // text which displays right now:
    var currentStory = "" {
        didSet {
            storyLabel.text = "\(currentStory)"
        }
    }
    
    // property of our Story struct on the View Controller so we can have access to it here
    var story = Story()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // action that happen when we press the buttons:
    @IBAction func pressButtons(_ sender: UIButton) {
        
        // let's detect what choice user has made:
        let userChoice = sender.currentTitle
        
        // now we should check choice with possible choices from Story array
    }
}

