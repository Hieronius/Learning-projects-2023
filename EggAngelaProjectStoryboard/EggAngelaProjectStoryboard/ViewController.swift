//
//  ViewController.swift
//  EggAngelaProjectStoryboard
//
//  Created by Арсентий Халимовский on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var hardness = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func yolkCheck() {
        switch hardness {
        case "Soft":
            print("the time of cooking for soft yolk is \((eggTimes["Soft"])!) minutes")
        case "Medium":
            print("the time of cooking for medium yolk is \((eggTimes["Medium"])!) minutes")
        case "Hard":
            print("the time of cooking for hard yolk is \((eggTimes["Hard"])!) minutes")
        default:
            print("Unknown state")
        }
    }


    @IBAction func typeOfTheEgg(_ sender: UIButton) {
        
        hardness = sender.currentTitle!
        
        yolkCheck()
        
    }
}

