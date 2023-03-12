//
//  ViewController.swift
//  TabBarPractice
//
//  Created by Арсентий Халимовский on 12.03.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logInButtonPressed(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabBar = segue.destination as? TabBarViewController {
            tabBar.login = loginTextField.text
            tabBar.password = passTextField.text
            print(tabBar.login)
            print(tabBar.password)
        }
    }
    
}

