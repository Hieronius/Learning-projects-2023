

import Foundation
import UIKit
import AVFoundation


// MARK: All function for our button:

extension ViewController {
    
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
    
    // method to set progressBar
     @objc func setProgressBar() {
        
        progressBar.setProgress(0, animated: false)
        // current progress:
        progressBar.progress = 0.0
        
        //        // code for adding progress to the progress bar
        //        if progressBar.progress != 1 {
        //            self.progressBar.progress += 2/10
        //        } else {
        //            print("progress is done")
        //        }
        
        //        // adding progress
        //        if counter > -1 {
        //            print("\(progressBar.progress) to end this timer")
        //            progressBar.progress += 0.01
        //        }
    }
    
    // objc method to update our timer
    @objc func updateCounter() {
        
        
        print("\(onePersentOfProgressBar) - 1% of timer cost)")
        // here we wan't be sure that time won't go below 0 because there is no such a thing like a minus time
        // so each second we wan't to subtract one second from the timer number
        if counter > 0 {
            // print how much seconds left
            print("\(counter) seconds to the end of the timer")
            
            // set label text as our current amount of second to end
            labelTitle.text = "\(counter)"
            
            // adding progress
                print("\(progressBar.progress) to end this timer")
                progressBar.progress += Float(onePersentOfProgressBar)
            
            // deduct one point from the timer
            counter -= 1
            
            // added special check if counter equal to zero or less let's print a message
            
        } else {
            labelTitle.text = "Your egg is cooked"
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
    
}
