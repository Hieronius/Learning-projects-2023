//
//  ViewController.swift
//  SB UIKit app
//
//  Created by Арсентий Халимовский on 17.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControll: UISegmentedControl!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        segmentControll.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        mainLabel.text = ""
        mainLabel.font = mainLabel.font.withSize(30)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        
        slider.value = 1
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .blue
        slider.thumbTintColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        
        mainLabel.text = String(slider.value)
        
        button.layer.cornerRadius = 10
        button.setTitle("Готово", for: .normal)
    }

    @IBAction func segmentControlAction(_ sender: Any) {
        switch segmentControll.selectedSegmentIndex {
        case 0:
            mainLabel.text = "Выбран сегмент с индексом 0"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "Выбран сегмент с индексом 1"
            mainLabel.textColor = .yellow
        case 2:
            mainLabel.text = "Выбран сегмент с индексом 2"
            mainLabel.textColor = .green
        default:
            break
        }
    }
    
    
    @IBAction func sliderAction(_ sender: Any) {
        mainLabel.text = String(Int(slider.value))
    }
    
    
    @IBAction func buttonAction(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else { return }
        mainLabel.text = text
        
    }
    
}

