//
//  ViewController.swift
//  AngelaSoundProjectStoryboard
//
//  Created by Арсентий Халимовский on 19.01.2023.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    func playSound() {
        
        // faster and shorter way to define a url to our sound effect and force defining of our audio player plus getting it play
        let url = Bundle.main.url(forResource: "soundC", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
        
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print("button was pressed")
        playSound()
    }
    
}

