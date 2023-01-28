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
        
        // check if there is no element which out of range
        // Changed our properties to properties from QuizBrain file (quizBrain variable here in View controller)
        if quizBrain.questionNumber + 1 < quizBrain.quiz.count {
            // if there is no problem let's push the next question
            quizBrain.questionNumber += 1
        } else {
            // in other way let's start from zero
            quizBrain.questionNumber = 0
        }
            // display this question on the view
            updateUI()
       
    }
    
    // function to reload our questions
    // chenged to properties from quizBrain
    func updateUI() {
        
        // read the question
        question = quizBrain.getQuestionText()
        
        
        // update current status of progress bar
        self.progressBar.progress += quizBrain.getProgress()
        
        // use of gcd to clean our buttons after 0,5 sec delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        })
        
    }
}

