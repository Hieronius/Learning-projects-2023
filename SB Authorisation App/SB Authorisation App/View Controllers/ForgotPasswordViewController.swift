//
//  ForgotPasswordViewController.swift
//  SB Authorisation App
//
//  Created by Арсентий Халимовский on 21.02.2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    let userData = UserInfoData()
    
    
    @IBOutlet weak var sendLoginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
    }
    
    
    @IBAction func sendPasswordButtonPressed(_ sender: Any) {
        
        // alert controller
        
        if sendLoginTextField.text == userData.login {
            let ac = UIAlertController(title: "Message", message: "Your password is \(userData.password)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Log in", style: .default) { action in
                self.performSegue(withIdentifier: "gotPasswordSegue", sender: sender)
            })
                         
            self.present(ac, animated: true)
            
        } else {
            let ac = UIAlertController(title: "Error", message: "Login is not founded", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Try again", style: .default))
            self.present(ac, animated: true)
        }
    }
}
