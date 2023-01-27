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
    
    // array of the questions and answers to them
    var quiz = [
            Question(q: "A slug's blood is green.", a: "True"),
            Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
            Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
            Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
            Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
            Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
            Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
            Question(q: "Google was originally called 'Backrub'.", a: "True"),
            Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
            Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
            Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
            Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    // current question number
    var questionNumber = 0
    
    
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
        
        // detection of what answer is really true or false:
        let actualAnswer = quiz[questionNumber].answer
        
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

