//
//  ViewController.swift
//  Quizzler
//
//  Created by Арсентий Халимовский on 26.01.2023.
//

import UIKit

// Creation of struct of questions and asnwers
struct Question {
    var question = ""
    var answer = ""
}

// making some properties of QuestionStruct:
var firstQuestion = Question(question: "Four + Two is equal to Six", answer: "True")
var secondQuestion = Question(question: "Five - Three is greater than One", answer: "True")
var thirdQuestion = Question(question: "Three + Eight is less than Ten", answer: "False")



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
    var quiz = [firstQuestion, secondQuestion, thirdQuestion]

//    let quiz = [
//        ["Four + Two is equal to Six", "True"],
//        ["Five - Three is greater than One", "True"],
//        ["Three + Eight is less than Ten", "False"]
//        ]
    
    // current question number
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
        let actualAnswer = quiz[questionNumber].answer
        
        // check user's answer and current right answer:
        if userAnswer == actualAnswer {
            print("right")
        } else {
            print("Wrong")
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
        question = quiz[questionNumber].question
        
        
    }
}

