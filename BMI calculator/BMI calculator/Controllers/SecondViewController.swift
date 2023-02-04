//
//  SecondViewController.swift
//  BMI calculator
//
//  Created by Арсентий Халимовский on 04.02.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // define background color for superView:
        view.backgroundColor = .red
        
        // create a new label:
        let label = UILabel()
        label.text = "Hello"
        
        // location of our label:
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        // add label to superView:
        view.addSubview(label)
    }
}
