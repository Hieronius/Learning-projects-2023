//
//  ResultViewController.swift
//  SB AnimalQuiz
//
//  Created by Арсентий Халимовский on 22.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавиться от кнопки возврата на предыдущий экран
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        // some code here
    }
}
