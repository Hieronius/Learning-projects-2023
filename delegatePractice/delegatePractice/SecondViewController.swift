//
//  SecondViewController.swift
//  delegatePractice
//
//  Created by Арсентий Халимовский on 01.03.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var moodTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
