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
    
    // here i should define an instance of the Timer class. One for all project
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func setCountDown() {
        // custom timer
        // We should define our timer property with specific settings:
        // Timer - it's a class for defining any timers
        // scheduledTimer - mean the specific options of timer
        // timer inverval - how fast timer will go
        // target - this or different view controller
        // selector - specific function of method to run each interval
        // userInfo - i think something like documentary
        // repeats - one time or more we wan't to repeat our timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    // objc method to update our timer
    @objc func updateCounter() {
        
        
        if counter > 0 {
            print("\(counter) seconds to the end of the timer")
            counter -= 1
        }
    }
    
    // here we use print that depends of current state of the pressed button
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

    // our button to press
    @IBAction func typeOfTheEgg(_ sender: UIButton) {
        
        // each new click of the button we won't reser our timer
        timer.invalidate()
        
        // and set the counter number to default:
        counter = 60
        
        // here we wan't to check the name of the button that was pressed
        hardness = sender.currentTitle!
        
        // here we wan't to check the time needed for cooking a specific type of the egg.
        yolkCheck()
        
        // here we wan't to start our timer
        setCountDown()
        
    }
}

