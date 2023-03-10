//
//  ViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

class AuthorisationViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // i can define a function for each element so i can hide a lot of code
        emailTextField.layer.cornerRadius = 20
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.masksToBounds = true
        
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.masksToBounds = true
        
        logInButton.layer.cornerRadius = 20
        
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "TabBarSegue", sender: sender)
    }
    
    
    @IBAction func registrationButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "ShowRegistration", sender: sender)
    }
    
    
    @IBAction func resetPasswordButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showReset", sender: sender)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        
    }
    
    
    
}

