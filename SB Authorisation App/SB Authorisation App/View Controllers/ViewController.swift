//
//  ViewController.swift
//  SB Authorisation App
//
//  Created by Арсентий Халимовский on 21.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let userInfo = UserInfoData()
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logInButtonPressed(_ sender: Any) {
        
        // if login and password are correct let's inter to the app
        if loginTextField.text == userInfo.login && passwordTextField.text == userInfo.password {
            // make segue with segue identifier.
            performSegue(withIdentifier: "LogInSegue", sender: sender)
            // if not tell to user that his data is not correct.
        } else {
            let ac = UIAlertController(title: "Error", message: "Login or Password is not correct", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(ac, animated: true)
        }
    }
    
    @IBAction func forgotUserNamePressed(_ sender: Any) {
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
    }
    
    
}

