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
    
    // text for first button:
    var rightAnswer = "" {
        didSet {
            rightButton.titleLabel?.text = "\(rightAnswer)"
        }
    }
    
    // text for second button
    var leftAnswer = "" {
        didSet {
            leftButton.titleLabel?.text = "\(leftAnswer)"
        }
    }
    
    
    
    // property of our Story struct on the View Controller so we can have access to it here
    var story = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // load first starting part of the story:
        currentStory = story.stories[0].title
        leftAnswer = story.stories[0].choice1
        rightAnswer = story.stories[0].choice2
        
        // define our label as this story part:
        storyLabel.text = currentStory
        
        // define possible answers:
        leftButton.titleLabel?.text = leftAnswer
        rightButton.titleLabel?.text = rightAnswer
    }

    // action that happen when we press the buttons:
    @IBAction func pressButtons(_ sender: UIButton) {
        
        // let's detect what choice user has made:
        // Need some instructions
        let userChoice = sender.currentTitle!
        
        // now we should check choice with possible choices from Story array
        story.checkAnswer(userChoice)
        
        currentStory = story.getText()
    }
}

