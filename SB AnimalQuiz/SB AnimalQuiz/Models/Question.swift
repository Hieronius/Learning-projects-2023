//
//  Question.swift
//  SB AnimalQuiz
//
//  Created by Арсентий Халимовский on 20.02.2023.
//

enum ResponseType {
    case single
    case multiple
    case range
}

struct Question {
    let text: String
    let type: ResponseType
    let answer: [Answer]
}
