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
        Question(text: "Which is the largest organ in the human body?", answer: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(text: "Five dollars is worth how many nickels?", answer: ["25", "50", "100"], correctAnswer: "100"),
        Question(text: "What do the letters in the GMT time zone stand for?", answer: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(text: "What is the French word for 'hat'?", answer: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(text: "In past times, what would a gentleman keep in his fob pocket?", answer: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(text: "How would one say goodbye in Spanish?", answer: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(text: "Which of these colours is NOT featured in the logo for Google?", answer: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(text: "What alcoholic drink is made from molasses?", answer: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(text: "What type of animal was Harambe?", answer: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(text: "Where is Tasmania located?", answer: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
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
        return quiz[questionNumber].text
       
    }
    
    // method to set a possible answers to buttons labels
    // it's return an array of strings instead of just a string
    func getPossibleAnswers() -> [String] {
        return quiz[questionNumber].answer
        
    }
    
    // value of one single question for progress bar
    func getProgress() -> Float {
        print(Float(quiz.count))
        return Float(1) / Float(quiz.count)
        
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
            print("Let's start again")
            // and let's reset our score
            score = 0
            // set progress as zero
            progressLevel = 0
            
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
