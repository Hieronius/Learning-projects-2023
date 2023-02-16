//
//  ViewController.swift
//  SB Hello world
//
//  Created by Арсентий Халимовский on 16.02.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var helloWorldLabel: UILabel!
    
    @IBOutlet weak var toogleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        helloWorldLabel.isHidden = true
        helloWorldLabel.layer.cornerRadius = 10
    }


    @IBAction func makeButtonAction(_ sender: Any) {
        if helloWorldLabel.isHidden {
            helloWorldLabel.isHidden = false
            toogleButton.setTitle("Hide Text", for: .normal)
        } else {
            helloWorldLabel.isHidden = true
            toogleButton.setTitle("Show text", for: .normal)
            
        }
    }
}

