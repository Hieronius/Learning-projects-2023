//
//  ViewController.swift
//  ProgressBarPractice
//
//  Created by Арсентий Халимовский on 21.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting a timer for start our progress bar to fill
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgressView), userInfo: nil, repeats: true)
        
        // setting starting options of our progress bar.
        // progress bar have values from 0 to 1, where is 0 - 0 % and 1 - 100 %
        progressBar.setProgress(0, animated: true)
        button.isHidden = true
        button.alpha = 0
    }
    
    // this method will be active each one second of our running timer
    @objc func updateProgressView() {
        
        // we should be sure that our progress bar is not completed
        if progressBar.progress != 1 {
            
            // add 20% for each second of the timer
            self.progressBar.progress += 0.2
        } else {
            
            // make button visible and set it's alpha to 1 is our progress bar is done
            self.button.isHidden = false
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                self.button.alpha = 1
            })
            // plus set text of the label to:
            self.label.text = "Loading is done"
        }
    }


}

