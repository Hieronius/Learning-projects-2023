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
    @IBOutlet weak var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.value = answerCount
        }
    }
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackVIew: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    
    @IBOutlet var rangedLabels: [UILabel]!
    
    
    
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answerChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answer
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        // some code here
    }
    
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answerChosen.append(currentAnswer)
        
        newQuestion()
    }
    
    @IBAction func multipleAnswersPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChosen.append(answer)
            }
        }
        
        newQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let index = Int(rangedSlider.value)
        answerChosen.append(currentAnswers[index])
        
        newQuestion()
    }
    
}

extension QuestionViewController {
    private func updateUI() {
        // Hide stacks
        for stackView in [singleStackView, multipleStackVIew, rangedStackView] {
            stackView?.isHidden = true
        }
        // get current question
        let currentQuestion = questions[questionIndex]
        
        // set current question for label
        questionLabel.text = currentQuestion.text
        
        // calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // set progress for progreeView
        progressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        // show current StackView
        showCurrentStackView(for: currentQuestion.type)
    }
    
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackVIew.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    private func newQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        
        performSegue(withIdentifier: "showSegue", sender: nil)
    }
    
}
