//
//  ViewController.swift
//  SB AnimationApp
//
//  Created by Арсентий Халимовский on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var coreAnimationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func coreAnimationButtonPressed(_ sender: UIButton) {
        sender.pulsate()
    }
    
}

