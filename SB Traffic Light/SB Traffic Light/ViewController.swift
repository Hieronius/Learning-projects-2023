//
//  ViewController.swift
//  SB Traffic Light
//
//  Created by Арсентий Халимовский on 16.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var buttonLabel: UIButton!
    
    @IBOutlet weak var redCircleView: UIImageView!
    @IBOutlet weak var yellowCircleView: UIImageView!
    @IBOutlet weak var greenCircleView: UIImageView!
    
    var currentStep = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redCircleView.layer.borderWidth = 10
        redCircleView.layer.backgroundColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        redCircleView.layer.cornerRadius = 50
        redCircleView.alpha = 0.3
        
        yellowCircleView.layer.borderWidth = 10
        yellowCircleView.layer.backgroundColor = CGColor(red: 0.5, green: 0.5, blue: 0, alpha: 1)
        yellowCircleView.layer.cornerRadius = 50
        yellowCircleView.alpha = 0.3
        
        greenCircleView.layer.borderWidth = 10
        greenCircleView.layer.backgroundColor = CGColor(red: 0, green: 1, blue: 0, alpha: 1)
        greenCircleView.layer.cornerRadius = 50
        greenCircleView.alpha = 0.3
        
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        
        sender.setTitle("Next", for: .normal)
        
        switch currentStep {
        case 1:
            sender.titleLabel?.text = "Next"
            redCircleView.alpha = 1
        case 2:
            yellowCircleView.alpha = 1
            redCircleView.alpha = 0.3
        case 3:
            greenCircleView.alpha = 1
            yellowCircleView.alpha = 0.3
        case 4:
            currentStep = 0
            greenCircleView.alpha = 0.3
            sender.setTitle("Start", for: .normal)
        default:
            break
        }
        currentStep += 1
        
    }
}



