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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        redColorSlider.value = 1
        redColorSlider.minimumValue = 0
        redColorSlider.maximumValue = 255
        
        greenColorSlider.value = 1
        greenColorSlider.minimumValue = 0
        greenColorSlider.maximumValue = 255
        
        blueColorSlider.value = 1
        blueColorSlider.minimumValue = 0
        blueColorSlider.maximumValue = 255
        
//        slider.value = 1
//        slider.minimumValue = 1
//        slider.maximumValue = 100
//        slider.minimumTrackTintColor = .yellow
//        slider.maximumTrackTintColor = .blue
//        slider.thumbTintColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
    }
    
    
    @IBAction func redColorSliderTouched(_ sender: Any) {
        redLabelColor.text = String(Int(redColorSlider.value))
    }
    
    @IBAction func greenColorSliderTouched(_ sender: Any) {
        greenLabelColor.text = String(Int(greenColorSlider.value))
    }
    
    @IBAction func blueColorSliderTouched(_ sender: Any) {
        blueLabelColor.text = String(Int(blueColorSlider.value))
    }
    
}

