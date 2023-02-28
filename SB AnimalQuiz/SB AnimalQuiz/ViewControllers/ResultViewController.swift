//
//  ResultViewController.swift
//  SB AnimalQuiz
//
//  Created by Арсентий Халимовский on 22.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var questionVC = QuestionViewController()
    
    var results = [Answer]()
    
    
    
    // 1. Передать сюда массив с ответами ✅
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавиться от кнопки возврата на предыдущий экран ✅
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            print("results from Question VC - \(self.questionVC.results.count)")
            self.results = self.questionVC.results
            print("results from Result VC - \(self.results.count)")
        })
        
        print(questionVC.counter)
        print("results from Question VC - \(questionVC.results.count)")
        results = questionVC.results
        print("results from Result VC - \(results.count)")
        
    }
}
