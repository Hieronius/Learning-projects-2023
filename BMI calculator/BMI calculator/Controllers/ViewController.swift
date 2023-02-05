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

    // set a height for calculation
    @IBAction func HeightSliderTouched(_ sender: UISlider) {
         height = round(sender.value * 100) / 100
         HeightValue.text = "\(height)m"
    }
    
    // set a weight for calculation
    @IBAction func WeightSliderTouched(_ sender: UISlider) {
        
        weight = round(sender.value * 10) / 10
        WeightValue.text = "\(weight)kg"
    }
    
    // formula for calculation
    @IBAction func calculatePressed(_ sender: UIButton) {
        // Body Mass Ratio = Weight(kg) / Height(m) * Height(m):
        let bmi = Int(weight / (height * height))
        print("BMI = \(bmi)")
        
        // creation of the segur from first VC to Result VC
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
}

