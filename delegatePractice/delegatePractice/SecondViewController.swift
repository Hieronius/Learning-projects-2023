//
//  SecondViewController.swift
//  delegatePractice
//
//  Created by Арсентий Халимовский on 01.03.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var setScoreTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // code here
    }
    
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        dismiss(animated: true)
    }
}
