//
//  RegistrationViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.layer.cornerRadius = 20
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.borderColor = UIColor.white.cgColor
        nameTextField.layer.masksToBounds = true
        
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
    
}
