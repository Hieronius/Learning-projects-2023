//
//  AnimationsModel.swift
//  SB SpringApp
//
//  Created by Арсентий Халимовский on 06.03.2023.
//

import Foundation

class AnimationsManager {
    
    static let share = AnimationsManager()
    
    var animations = ["pop", "slideLeft", "slideRight", "slideDown", "slideUp", "squeezeLeft", "squeezeRight", "squeezeUp", "fadeIn", "fadeOut"]
    
    func getAnimation() -> String {
        animations.shuffled().randomElement()!
    }
}
