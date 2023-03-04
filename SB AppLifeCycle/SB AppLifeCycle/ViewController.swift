//
//  ViewController.swift
//  SB AppLifeCycle
//
//  Created by Арсентий Халимовский on 04.03.2023.
//

import UIKit

class ViewController: UIViewController {


    
    // 1. Когда создается обьект, первым срабатывает инициализация
    // Если создать какой-нибудь оутлет через сториборд, то он будет готов сразу после инициализации
    // init() { }
    //
    
    // 2. View загружается
    override func loadView() {
        super.loadView()
    }
    
    // 3. View загрузились
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}

