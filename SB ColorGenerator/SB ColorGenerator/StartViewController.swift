//
//  StartViewController.swift
//  SB ColorGenerator
//
//  Created by Арсентий Халимовский on 28.02.2023.
//

import UIKit

protocol StartViewDelegate: class {
    func update(color: UIColor)
}

class StartViewController: UIViewController {
    
    var backGroundColor: UIColor = .blue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = backGroundColor
        setBackgroundColor()
        
        
    }
    
    func setBackgroundColor() {
        backGroundColor = .white
        self.view.backgroundColor = backGroundColor
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        
        let vc = ViewController()
        vc.startViewDelegate = self
        performSegue(withIdentifier: "showGenerator", sender: sender)
    
        
    }
}

extension StartViewController: StartViewDelegate {
    func update(color: UIColor) {
        backGroundColor = color
    }
    
    
}
