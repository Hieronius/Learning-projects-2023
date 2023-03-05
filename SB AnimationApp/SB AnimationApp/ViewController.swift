//
//  ViewController.swift
//  SB AnimationApp
//
//  Created by Арсентий Халимовский on 05.03.2023.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    
    @IBOutlet weak var coreAnimationView: UIView!
    
    @IBOutlet weak var springAnimationView: SpringView!
    
    
    private var originCoordinate: CGFloat?
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        originCoordinate = coreAnimationView.frame.origin.x
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originCoordinate = coreAnimationView.frame.origin.x
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func coreAnimationButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat]) { [weak self] in
            guard let self = self else { return }
            
            if self.coreAnimationView.frame.origin.x == self.originCoordinate {
                self.coreAnimationView.frame.origin.x -= 40.0
            }
            
        } 
            
        }
    
    @IBAction func springAnimationRunButtonPressed(_ sender: SpringButton) {
        
        springAnimationView.animation = Spring.AnimationPreset.slideLeft.rawValue
        springAnimationView.curve = Spring.AnimationCurve.easeIn.rawValue
        springAnimationView.duration = 1
        springAnimationView.animate()
        
        sender.animation = "shake"
        sender.animate()
    }
    
}
