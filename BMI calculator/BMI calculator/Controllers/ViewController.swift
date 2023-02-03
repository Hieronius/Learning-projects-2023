//
//  ViewController.swift
//  BMI calculator
//
//  Created by Арсентий Халимовский on 02.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var HeightSlider: UISlider!
    @IBOutlet weak var WeightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func HeightSliderTouched(_ sender: UISlider) {
        print("there is a sender.value - \(sender.value)")
    }
    
    @IBAction func WeightSliderTouched(_ sender: UISlider) {
        print("there is a sender.value - \(sender.value)")
    }
    
}

