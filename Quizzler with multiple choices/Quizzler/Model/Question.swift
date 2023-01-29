//
//  Questions.swift
//  Quizzler
//
//  Created by Арсентий Халимовский on 27.01.2023.
//

import Foundation

// Creation of struct of questions, possible answers and correct answer
struct Question {
    var text = ""
    var answer = [""]
    var correctAnswer = ""
    
    
    // very bad naming by Angela, not me
    // renamed all of it so readability should be better
    init(text: String, answer: [String], correctAnswer: String) {
        self.text = text
        self.answer = answer
        self.correctAnswer = correctAnswer
    }
}
