//
//  Story.swift
//  StoryTeller
//
//  Created by Арсентий Халимовский on 30.01.2023.
//

import Foundation
import UIKit


// struct for each slide of the story with possible answers
struct Story {
    
    // logo of the story fragment:
    var title = ""
    
    // first possible choice:
    var choice1 = ""
    // result of the first choice:
    var choice1Destination = 0
    
    // second possible choice
    var choice2 = ""
    // result of the second choice:
    var choice2Destination = 0
    
    init(title: String = "", choice1: String = "", choice1Destination: Int = 0, choice2: String = "", choice2Destination: Int = 0) {
        self.title = title
        self.choice1 = choice1
        self.choice1Destination = choice1Destination
        self.choice2 = choice2
        self.choice2Destination = choice2Destination
    }
}
