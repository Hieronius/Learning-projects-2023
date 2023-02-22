//
//  QuestionViewController.swift
//  SB AnimalQuiz
//
//  Created by Арсентий Халимовский on 20.02.2023.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackVIew: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    
    @IBOutlet var rangedLabels: [UILabel]!
    
    private let questions = Question.getQuestions()
    private var currentIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // some code here
    }
    
}

extension QuestionViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackVIew, rangedStackView] {
            stackView?.isHidden = true
        }
        let currentQuestion = questions[currentIndex]
    }
    
}
