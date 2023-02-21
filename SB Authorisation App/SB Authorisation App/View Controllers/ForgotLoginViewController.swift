//
//  ForgotLoginViewController.swift
//  SB Authorisation App
//
//  Created by Арсентий Халимовский on 21.02.2023.
//

import UIKit

class ForgotLoginViewController: UIViewController {
    
    let userData = UserInfoData()
    
    
    @IBOutlet weak var sendMainTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
    }
    
    @IBAction func sendEmailButtonPressed(_ sender: Any) {
        
        if sendMainTextField.text == userData.email {
            let ac = UIAlertController(title: "Message", message: "Your login is \(userData.login)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Log in", style: .default) { action in
                self.performSegue(withIdentifier: "gotLoginSegue", sender: sender)
            })
                         
            self.present(ac, animated: true)
            
        } else {
            let ac = UIAlertController(title: "Error", message: "Email is not founded", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Try again", style: .default))
            self.present(ac, animated: true)
        }
    }
    
}
