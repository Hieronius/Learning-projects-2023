//
//  ViewController.swift
//  Angela-MagicBallApp-Storyboard
//
//  Created by Арсентий Халимовский on 17.01.2023.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballAnswer: UIImageView!
    
    var player: AVAudioPlayer?
    
    let arrayOfTheAnswers =
        [
        UIImage(named: "ball1"),
        UIImage(named: "ball2"),
        UIImage(named: "ball3"),
        UIImage(named: "ball4"),
        UIImage(named: "ball5")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func askQuestion(_ sender: UIButton) {
        
        playSound()
        
        changeBallAnswer()
    }
    
    func changeBallAnswer() {
        ballAnswer.image = arrayOfTheAnswers.randomElement()!
    }
    
    func playSound() {
        
        guard let path = Bundle.main.path(forResource: "sound", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

