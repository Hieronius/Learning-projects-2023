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
    
    @objc func updateProgressView() {
        if progressBar.progress != 1 {
            self.progressBar.progress += 0.2
        } else {
            self.button.isHidden = false
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                self.button.alpha = 1
            })
            self.label.text = "Loading is done"
        }
    }


}

