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
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    // text for our questionLabel
    var question = "" {
        didSet {
            questionLabel.text = "\(question)"
        }
    }
    
    // Property of our logic center of the app
    // So we can use this module here
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // let's activate progress bar
        progressBar.setProgress(0, animated: true)
        
        updateUI()
        
    }


    
    // function for both our answers
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        // detection of which button user will press:
        let userAnswer = sender.currentTitle!
        
        // Let's check user answer with the right one
        // Defined a result of this function as a constant
        let isUserRightOrWrong = quizBrain.checkAnswer(userAnswer)
        
        // check user's answer and current right answer:
        // if return is True - color should be green, if False - color should be red
        if isUserRightOrWrong {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        
        // set a new question
        quizBrain.newQuestion()
        
        
            // display this question on the view
            updateUI()
        
        // special check for current progress
        // If it's already done let's reset the progress bar value
        if progressBar.progress == 1 {
            progressBar.progress = quizBrain.getProgress()
        }
    }
    
    // function to reload our questions
    // chenged to properties from quizBrain
    func updateUI() {
        
        // read the question
        question = quizBrain.getQuestionText()
        
        
        // update current status of progress bar
        self.progressBar.progress += quizBrain.getProgress()
        
        // update our score label
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        // use of gcd to clean our buttons after 0,5 sec delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.firstButton.backgroundColor = UIColor.clear
            self.secondButton.backgroundColor = UIColor.clear
            self.thirdButton.backgroundColor = UIColor.clear
        })
        
    }
}

