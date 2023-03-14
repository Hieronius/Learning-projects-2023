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
    
    var isTextFieldsIsEmpty: Bool {
        nameTextField.text?.isEmpty == true ||
        emailTextField.text?.isEmpty == true ||
        passwordTextField.text?.isEmpty == true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNameTextField()
        setupEmailTextField()
        setupPasswordTestField()
        setupLogInButton()
    }
    
    func setupNameTextField() {
        nameTextField.layer.cornerRadius = 20
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.borderColor = UIColor.white.cgColor
        nameTextField.layer.masksToBounds = true
    }
    
    func setupEmailTextField() {
        emailTextField.layer.cornerRadius = 20
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.masksToBounds = true
    }
    
    func setupPasswordTestField() {
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.masksToBounds = true
    }
    
    func setupLogInButton() {
        logInButton.layer.cornerRadius = 20
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        if isTextFieldsIsEmpty {
            let ac = UIAlertController(title: "Ошибка", message: "Заполните пустые поля", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
            
        } else if isValidEmail(emailTextField.text!) == false {
            let ac = UIAlertController(title: "Ошибка", message: "Проверьте правильность ввода почты", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
            
        } else {
            performSegue(withIdentifier: "RegistrationToTabBarSegue", sender: sender)
        }
    }
}
