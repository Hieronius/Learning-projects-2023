//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Арсентий Халимовский on 28.01.2023.
//

import Foundation

// Model-Logic-Center of our app
struct QuizBrain {
    
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
    
    // current score of the user
    var score = 0
    
    // set a variable for progress bar
    var progressLevel: Float = 0
    
    
    // method to check answer instead of view controller
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        
        // stuped checkout of status of our answer:
        // yes i wan't implement here guard but seems like it's not nesessary
        if userAnswer == quiz[questionNumber].answer {
            // User got it right
            score += 1
            return true
        } else {
            // User got it wrong
            return false
        }
    }
    
    // method to set a question for our app
    func getQuestionText() -> String {
      quiz[questionNumber].text
       
    }
    
    // value of one single question for progress bar
    func getProgress() -> Float {
        Float(1) / Float(quiz.count)
    }
    
    mutating func newQuestion() {
        // check if there is no element which out of range
        // Changed our properties to properties from QuizBrain file (quizBrain variable here in View controller)
        if questionNumber + 1 < quiz.count {
            // if there is no problem let's push the next question
            questionNumber += 1
        } else {
            // in other way let's start from zero
            questionNumber = 0
            // and let's reset our score
            score = 0
            // set progress as zero
            
        }
    }
    
    // this func will present our score to View controller
    func getScore() -> Int {
        return score
    }
    
    func getProgressBarReset() -> Float {
        return progressLevel
    }
}
