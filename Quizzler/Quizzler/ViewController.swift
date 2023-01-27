//
//  ViewController.swift
//  Quizzler
//
//  Created by Арсентий Халимовский on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // list of the objects from storyboard:
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    var question = "" {
        didSet {
            questionLabel.text = "\(question)"
        }
    }
    
    let quiz = [
        ["Four + Two is equal to Six", "True"],
        ["Five - Three is greater than One", "True"],
        ["Three + Eight is less than Ten", "False"]
        ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        
    }


    // function for both our answers
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // detection of which button user will press:
        let userAnswer = sender.currentTitle
        
        // detection of what answer is really true or false:
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("right")
        } else {
            print("Wrong")
        }
        
        // open the next question of quiz array
        questionNumber += 1
        // display this question on the view
        updateUI()
       
    }
    
    // function to reload our questions
    func updateUI() {
        question = quiz[questionNumber][0]
        
        
    }
}

