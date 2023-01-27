//
//  ViewController.swift
//  Quizzler
//
//  Created by Арсентий Халимовский on 26.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // list of the objects from storyboard:
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    var question = "" {
        didSet {
            questionLabel.text = "\(question)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        question = "Four + Two is equal to Six"
    }


    // function for both our answers
    @IBAction func answerButtonPressed(_ sender: UIButton) {
    }
}

