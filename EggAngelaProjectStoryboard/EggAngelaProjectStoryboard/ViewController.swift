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
    
    // Needed time for custom countdown
    var counter = 60

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // custom timer
        // Timer - it's a class for defining any timers
        // scheduledTimer - mean the specific options of timer
        // timer inverval - how fast timer will go
        // target - this or different view controller
        // selector - specific function of method to run each interval
        // userInfo - i think something like documentary
        // repeats - one time or more we wan't to repeat our timer
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if counter > 0 {
            print("\(counter) seconds to the end of the timer")
            counter -= 1
        }
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

