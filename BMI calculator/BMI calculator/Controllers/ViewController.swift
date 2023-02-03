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
    
    var height: Float = 0
    var weight: Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func HeightSliderTouched(_ sender: UISlider) {
         height = round(sender.value * 100) / 100
         HeightValue.text = "\(height)m"
    }
    
    @IBAction func WeightSliderTouched(_ sender: UISlider) {
        
        weight = round(sender.value * 10) / 10
        WeightValue.text = "\(weight)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(Int((height) * (weight)))
    }
    
}

