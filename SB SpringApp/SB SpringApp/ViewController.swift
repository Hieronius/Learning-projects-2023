//
//  ViewController.swift
//  SB SpringApp
//
//  Created by Арсентий Халимовский on 05.03.2023.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    var animationManager = AnimationsManager.shared
    lazy var arrayOfAnimations = animationManager.getAnimation()
    var currentAnimation = 0
    
    @IBOutlet weak var springAnimationView: SpringView!
    
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var buttonLabel: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func springAnimationRunButtonPressed(_ sender: SpringButton) {
        
        if currentAnimation < (arrayOfAnimations.count - 1) {
            
            // change view animation and define name for animation label
            // probably i should define the whole array of animations and use switch or if else to define it's name for label and for button
            springAnimationView.animation = "\(arrayOfAnimations[currentAnimation])"
            springAnimationView.animate()
            animationLabel.text = "\(springAnimationView.animation)"
            
            buttonLabel.setTitle("\(arrayOfAnimations[currentAnimation + 1])", for: .normal)
            
            self.currentAnimation += 1
            
        } else {
            self.currentAnimation = 0
        }
        
    }
}
