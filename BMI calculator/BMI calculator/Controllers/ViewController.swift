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
    
    @IBOutlet weak var HeightValue: UILabel!
    @IBOutlet weak var WeightValue: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func HeightSliderTouched(_ sender: UISlider) {
        HeightValue.text = "\(round(sender.value * 100) / 100)m"
    }
    
    @IBAction func WeightSliderTouched(_ sender: UISlider) {
        WeightValue.text = "\(Int(sender.value))kg"
    }
    
}

