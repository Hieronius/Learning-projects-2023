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
    
    func playSound(buttonName: String) {
        
        // faster and shorter way to define a url to our sound effect and force defining of our audio player plus getting it play
        // defined a special parameter - name of the pressed button
        let url = Bundle.main.url(forResource: "sound\(buttonName)", withExtension: "wav")
        // we sure that there is always should be name of the button so we can force unwrap it with try!
        player = try! AVAudioPlayer(contentsOf: url!)
        // play our sound
        player?.play()
        
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        // defined a name of the pressed button
        let whichButton = sender.titleLabel?.text ?? "name"
        
        // first part of the challenge
        // changing opacity of the button to the half
        sender.alpha = 0.5
        
        // second part of the challenge
        // defined a dispatch main thread for async function to get button back to it's previous condition.
        // as we can see we might use "execute" as a closure without "in" and arguments.
        // Trailing closure is also forbidden here
        // brakets is the must after our closure to show that there is no input parameters
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            sender.alpha = 1
        })
        
        print(whichButton)
        print(sender.backgroundColor!)
        // current name of the button moves to the our function playSound()
        playSound(buttonName:whichButton)
    }
    
    
    
}

