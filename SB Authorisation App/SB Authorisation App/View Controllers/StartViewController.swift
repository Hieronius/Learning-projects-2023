//
//  StartViewController.swift
//  SB Authorisation App
//
//  Created by Арсентий Халимовский on 21.02.2023.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // text some code here
    }
    
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "LogOutSegue", sender: sender)
    }
}
