//
//  ViewController.swift
//  EggAngelaProjectStoryboard
//
//  Created by Арсентий Халимовский on 20.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Proreprties:
    
    // our progress bar
    @IBOutlet weak var progressBar: UIProgressView!
    
    // title outlet for our label
    @IBOutlet weak var labelTitle: UILabel!
    
    // array of all possible yolk types
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 5]
    
    // type of the yolk
    var hardness = ""
    
    // Needed time for custom countdown
    var counter = 60
    
    // here i should define an instance of the Timer class. One for all project
    var timer = Timer()
    
    // current state of the progress bar
    var progress = 0
    
    // How much % value has each of every second in specific timer
    var costOfOneSecondInPercentage: Float = 0.0
    
    // Total amount of the second for progressBar
    var totalCounter = 0
    
    
    // MARK: Button with timers:

    // our button to press
    @IBAction func typeOfTheEgg(_ sender: UIButton) {
        
        
        // each new click of the button we wan't reset our timer
        timer.invalidate()
        
        // each new click our progress bar should be reseted too
        progressBar.progress = 0.0
        
        // here we wan't to check the name of the button that was pressed
        hardness = sender.currentTitle!
        
        // and set the counter number to default which equal to the time for cooking a specific type of the yolk:
        counter = eggTimes[hardness]!
        
        // How much second will be set as 100 % in our progress bar:
        totalCounter = counter
        
        // Calculation of 1 % for progressBar
        costOfOneSecondInPercentage = (Float(100) / Float(totalCounter)) / Float(100)
        print("\(costOfOneSecondInPercentage) - 1 sec has a % value)")
        
        // here we wan't to check the time needed for cooking a specific type of the egg.
        yolkCheck()
        
        // here we wan't to start our timer
        setCountDown()
        
        // here we wan't to start our progress bar
        setProgressBar()
        
    }
}


