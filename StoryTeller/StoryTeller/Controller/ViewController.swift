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
        
        // set start question and possible answers:
        updateUI()
        
    }

    // action that happen when we press the buttons:
    @IBAction func pressButtons(_ sender: UIButton) {
        
        // Some mechanism to animate our buttons:
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            sender.alpha = 1
        })
        
        // let's detect what choice user has made:
        // Need some instructions
        let userChoice = sender.titleLabel?.text!
        print(userChoice)
        let userChoiceSecond = sender.currentTitle
        print(userChoiceSecond)
        
        // now we should check choice with possible choices from Story array
        story.checkAnswer(userChoice!)
        
        
        updateUI()
        
//        // set new part of the story and buttons:
//        currentStory = story.getText()
//        leftAnswer = story.stories[nextPart].choice1
//        rightAnswer = story.stories[nextPart].choice2
    }
    
    func updateUI() {
        
        print(story.textPartNumber)
        
        // load first starting part of the story:
        currentStory = story.stories[story.textPartNumber].title
        leftAnswer = story.stories[story.textPartNumber].choice1
        rightAnswer = story.stories[story.textPartNumber].choice2
        
        // define our label as this story part:
        storyLabel.text = currentStory
        

        // another attempt to define buttons
        self.leftButton.setTitle(leftAnswer, for: .normal)
        self.rightButton.setTitle(rightAnswer, for: .normal)
        
    }
}

