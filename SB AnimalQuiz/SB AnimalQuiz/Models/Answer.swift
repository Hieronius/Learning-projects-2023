//
//  Answer.swift
//  SB AnimalQuiz
//
//  Created by Арсентий Халимовский on 20.02.2023.
//

struct Answer {
    let text: String
    let type: AnimalType
}

enum AnimalType: String {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
}
