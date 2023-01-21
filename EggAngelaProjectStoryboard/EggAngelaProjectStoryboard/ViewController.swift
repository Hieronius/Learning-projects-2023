//
//  ViewController.swift
//  EggAngelaProjectStoryboard
//
//  Created by Арсентий Халимовский on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // our progress bar
    @IBOutlet weak var progressBar: UIProgressView!
    
    // title outlet for our label
    @IBOutlet weak var labelTitle: UILabel!
    
    // array of all possible yolk types
    let eggTimes = ["Soft": 3, "Medium": 100, "Hard": 5]
    
    // type of the yolk
    var hardness = ""
    
    // Needed time for custom countdown
    var counter = 60
    
    // here i should define an instance of the Timer class. One for all project
    var timer = Timer()
    
    // current state of the progress bar
    var progress = 0
    
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
    
    // func to set our progress bar
    @objc func setProgressBar() {
        
        // Here will be my work in 21.01.23
        
        // 1 % of the total progress will be equal to:
        let onePersentOfProgress = Float(counter / 100)
        
        // print current amount of points of 1%
        print(onePersentOfProgress)
        
        // starting position for progress bar
        progressBar.setProgress(0, animated: false)
        // current progress:
        progressBar.progress = 0.0
        
        // code for adding progress to the progress bar
        if progressBar.progress != 1 {
            self.progressBar.progress += 2/10
        } else {
            print("progress is done")
        }
        
        // adding progress
        if counter > -1 {
            print("\(progressBar.progress) to end this timer")
            progressBar.progress += 1.0
        }
    }
    
    // objc method to update our timer
    @objc func updateCounter() {
        
        
        // here we wan't be sure that time won't go below 0 because there is no such a thing like a minus time
        // so each second we wan't to subtract one second from the timer number
        if counter > -1 {
            // print how much seconds left
            print("\(counter) seconds to the end of the timer")
            
            // set label text as our current amount of second to end
            labelTitle.text = "\(counter)"
            
            // deduct one point from the timer
            counter -= 1
            
            // added special check if counter equal to zero or less let's print a message
            if counter == -1 {
                labelTitle.text = "Your egg is cooked"
            }
        }
        
    }
    
    // here we use print that depends of current state of the pressed button
    func yolkCheck() {
        switch hardness {
        case "Soft":
            print("the time of cooking for soft yolk is \((eggTimes["Soft"])!) seconds")
        case "Medium":
            print("the time of cooking for medium yolk is \((eggTimes["Medium"])!) seconds")
        case "Hard":
            print("the time of cooking for hard yolk is \((eggTimes["Hard"])!) seconds")
        default:
            print("Unknown state")
        }
    }

    // our button to press
    @IBAction func typeOfTheEgg(_ sender: UIButton) {
        
        // each new click of the button we won't reser our timer
        timer.invalidate()
        
        // here we wan't to check the name of the button that was pressed
        hardness = sender.currentTitle!
        
        // and set the counter number to default which equal to the time for cooking a specific type of the yolk:
        counter = eggTimes[hardness]!
        
        // here we wan't to check the time needed for cooking a specific type of the egg.
        yolkCheck()
        
        // here we wan't to start our timer
        setCountDown()
        
        // here we wan't to start our progress bar
        setProgressBar()
        
    }
}

