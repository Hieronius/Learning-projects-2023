//
//  ViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

class AuthorisationViewController: UIViewController {
    
    
    @IBOutlet weak var testTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testTextField.layer.cornerRadius = 15.0
        testTextField.layer.borderWidth = 1.0
        testTextField.layer.borderColor = UIColor.gray.cgColor
    }

    
    @IBAction func RegistrationButton(_ sender: Any) {
        performSegue(withIdentifier: "ShowRegistration", sender: sender)
    }
    
    @IBAction func ResetButton(_ sender: Any) {
        performSegue(withIdentifier: "showReset", sender: sender)
    }
    
    @IBAction func TabBarButton(_ sender: Any) {
        performSegue(withIdentifier: "TabBarSegue", sender: sender)
        
       
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        
    }
    
    
    
}

