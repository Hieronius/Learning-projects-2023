

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
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounterAndProgressBar), userInfo: nil, repeats: true)
        
    }
    
    // method to set progressBar
     @objc func setProgressBar() {
        
        // set a starting point for progressBar
        progressBar.setProgress(0, animated: false)
        // current progress:
        progressBar.progress = 0.0
        
    }
    
    // objc method to update our timer
    @objc func updateCounterAndProgressBar() {
        
        // here we wan't be sure that time won't go below 0 because there is no such a thing like a minus time
        // so each second we wan't to subtract one second from the timer number
        if counter > 0 {
            // print how much seconds left
            print("\(counter) seconds to the end of the timer")
            
            
            
            
            // deduct one point from the timer
            counter -= 1
            
            // set label text as our current amount of second to end
            labelTitle.text = "\(counter)"
            
            // adding progress
                print("\(progressBar.progress) is current progress of your cooking")
            progressBar.progress += Float((costOfOneSecondInPercentage))
            
            // added special check if counter equal to zero or less let's print a message
            
        } else {
            labelTitle.text = "Your egg is cooked"
            playWarning()
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
    
    // function which should play our warning when egg has been cooked
    func playWarning() {
        
        // let's find a way to our warning sound file
        let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3")
        
        // if we sure that in the selecter directory we will always have the file let's unwrap it:
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        
        // when sound is loaded to our audio player let's run it
        audioPlayer.play()
        
    }
    
}
