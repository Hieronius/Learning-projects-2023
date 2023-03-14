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
    
    var isLogAndPasswordTextFieldsIsEmpty: Bool {
        emailTextField.text?.isEmpty == true ||
        passwordTextField.text?.isEmpty == true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEmailTextField()
        setupPasswordTextField()
        setupLogInButton()
    }
    
    func setupEmailTextField() {
        emailTextField.layer.cornerRadius = 20
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.layer.masksToBounds = true
    }
    
    func setupPasswordTextField() {
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.masksToBounds = true
    }
    
    func setupLogInButton() {
        logInButton.layer.cornerRadius = 20
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        if emailTextField.text == testUser.userLogin && passwordTextField.text == testUser.userPassword {
            performSegue(withIdentifier: "TabBarSegue", sender: sender)
            
        } else if isLogAndPasswordTextFieldsIsEmpty {
            let ac = UIAlertController(title: "Ошибка", message: "Заполните пустые поля", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
            
        } else if isValidEmail(emailTextField.text!) == false {
            let ac = UIAlertController(title: "Ошибка", message: "Проверьте правильность ввода почты", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)

        } else {
            let ac = UIAlertController(title: "Ошибка", message: "Указан неправильный логин или пароль", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        }
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

