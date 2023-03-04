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
    // стоит использовать lazy var outlets чтобы они были доступны во время загрузки view, а не во время инициализации. Это позволяет лучше оптимизировать память.
    override func loadView() {
        super.loadView()
    }
    
    // 3. View загрузились
    // Загружается всякий раз при push переходах и всего раз, если view вызван модально (popower)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 4. Срабатывает перед появлением view на экране
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // 5. Вызывается при расстановке констрейнтов
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    // 6. Срабатывает перед тем, как размер вью поменяется под размер экрана
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    // 7. Срабатывает после того, как размер вью поменяется под размер экрана
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // 8. Срабатывает после появления view на экране
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // 9. Срабатывает при повороте экрана
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    
    // 10. Срабатывает перед исчезновением view с экрана
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // 11. Срабатывает после исчезновения view с экрана
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // 12. Срабатывает перед освобождением экземпляра view
    // deinit()
    
    
    


}

