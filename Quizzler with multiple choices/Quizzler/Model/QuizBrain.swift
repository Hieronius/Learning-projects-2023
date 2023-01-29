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
    // multiple array with question: array of answers and the correct answer
    var quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], c: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], c: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], c: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], c: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], c: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], c: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], c: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], c: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], c: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], c: "Australia")
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
        if userAnswer == quiz[questionNumber].correctAnswer {
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
