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
        let userAnswer = sender.currentTitle
        
        quizBrain.checkAnswer()
        
        // check user's answer and current right answer:
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // check if there is no element which out of range
        if questionNumber + 1 < quiz.count {
            // if there is no problem let's push the next question
            questionNumber += 1
        } else {
            // in other way let's start from zero
            questionNumber = 0
        }
            // display this question on the view
            updateUI()
       
    }
    
    // function to reload our questions
    func updateUI() {
        
        // read the question
        question = quiz[questionNumber].text
        
        let valueOfSingleQuestionInProgressBar = Float(1) / Float(quiz.count)
        
        // update current status of progress bar
        self.progressBar.progress += valueOfSingleQuestionInProgressBar
        
        // use of gcd to clean our buttons after 0,5 sec delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        })
        
    }
}

