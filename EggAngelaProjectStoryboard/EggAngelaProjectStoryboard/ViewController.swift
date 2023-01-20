//
//  ViewController.swift
//  EggAngelaProjectStoryboard
//
//  Created by Арсентий Халимовский on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    var hardness = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func yolkCheck() {
        switch hardness {
        case "Soft":
            print("the time of cooking for soft yolk is \(softTime) minutes")
        case "Medium":
            print("the time of cooking for medium yolk is \(mediumTime) minutes")
        case "Hard":
            print("the time of cooking for hard yolk is \(hardTime) minutes")
        default:
            print("Unknown state")
        }
    }


    @IBAction func typeOfTheEgg(_ sender: UIButton) {
        
        hardness = sender.currentTitle!
        
        yolkCheck()
        
    }
}

