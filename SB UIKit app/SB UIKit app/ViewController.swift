//
//  ViewController.swift
//  SB UIKit app
//
//  Created by Арсентий Халимовский on 17.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControll: UISegmentedControl!
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        segmentControll.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        mainLabel.text = ""
        mainLabel.font = mainLabel.font.withSize(30)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
    }

    @IBAction func segmentControlAction(_ sender: Any) {
        switch segmentControll.selectedSegmentIndex {
        case 0:
            mainLabel.text = "Выбран сегмент с индексом 0"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "Выбран сегмент с индексом 1"
            mainLabel.textColor = .yellow
        case 2:
            mainLabel.text = "Выбран сегмент с индексом 2"
            mainLabel.textColor = .green
        default:
            break
        }
    }
    
}

