//
//  StartViewController.swift
//  SB ColorGenerator
//
//  Created by Арсентий Халимовский on 28.02.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    
    
    var backgroundColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        backgroundColor = view.backgroundColor
        print(backgroundColor)
        
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "showGenerator", sender: sender)
    }
}
