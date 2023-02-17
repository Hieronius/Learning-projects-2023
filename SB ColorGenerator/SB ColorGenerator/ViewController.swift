//
//  ViewController.swift
//  SB ColorGenerator
//
//  Created by Арсентий Халимовский on 17.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var colorImageView: UIImageView!
    
    
    @IBOutlet weak var redLabelColor: UILabel!
    @IBOutlet weak var greenLabelColor: UILabel!
    @IBOutlet weak var blueLabelColor: UILabel!
    
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    var redColorCurrentValue: Float = 0.0
    var greenColorCurrentValue: Float = 0.0
    var blueColorCurrentValue: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        redColorSlider.value = 0.1
        redColorSlider.minimumValue = 0
        redColorSlider.maximumValue = 1.0
        
        greenColorSlider.value = 0.1
        greenColorSlider.minimumValue = 0
        greenColorSlider.maximumValue = 1.0
        
        blueColorSlider.value = 0.1
        blueColorSlider.minimumValue = 0
        blueColorSlider.maximumValue = 1.0
        
        redLabelColor.text = "1.00"
        greenLabelColor.text = "1.00"
        blueLabelColor.text = "1.00"
        
//        colorImageView.backgroundColor = UIColor(red: CGFloat(redColorCurrentValue), green: CGFloat(greenColorCurrentValue), blue: CGFloat(blueColorCurrentValue), alpha: 1)
        
    }
    
    func changeImageViewBackgroundColor() {
        
        colorImageView.backgroundColor = UIColor(red: CGFloat(redColorCurrentValue), green: CGFloat(greenColorCurrentValue), blue: CGFloat(blueColorCurrentValue), alpha: 1)
    }
    
    
    @IBAction func redColorSliderTouched(_ sender: Any) {
        let value = (round(100 * (redColorSlider.value)) / 100)
        redLabelColor.text = String(value)
        redColorCurrentValue = value
        
        changeImageViewBackgroundColor()
        
    }
    
    @IBAction func greenColorSliderTouched(_ sender: Any) {
        let value = (round(100 * (greenColorSlider.value)) / 100)
        greenLabelColor.text = String(value)
        greenColorCurrentValue = value
        
        changeImageViewBackgroundColor()
    }
    
    @IBAction func blueColorSliderTouched(_ sender: Any) {
        let value = (round(100 * (blueColorSlider.value)) / 100 )
        blueLabelColor.text = String(value)
        blueColorCurrentValue = value
        
        changeImageViewBackgroundColor()
    }
    
    
}

