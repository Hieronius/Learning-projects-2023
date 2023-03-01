//
//  ViewController.swift
//  delegatePractice
//
//  Created by Арсентий Халимовский on 01.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculateButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "showSecond", sender: sender)
    }
}

