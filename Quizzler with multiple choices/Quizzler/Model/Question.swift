//
//  Questions.swift
//  Quizzler
//
//  Created by Арсентий Халимовский on 27.01.2023.
//

import Foundation

// Creation of struct of questions and asnwers
struct Question {
    var text = ""
    var answer = [""]
    var correctAnswer = ""
    
    
    // very bad naming by Angela, not me
    init(q: String, a: [String], c: String) {
        text = q
        answer = a
        correctAnswer = c
    }
}
