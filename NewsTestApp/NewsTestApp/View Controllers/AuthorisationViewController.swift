//
//  ViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

class AuthorisationViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    }

    
    
    // Optional - plz delete before publication
    @IBAction func RegistrationButton(_ sender: Any) {
        performSegue(withIdentifier: "ShowRegistration", sender: sender)
    }
    
    @IBAction func ResetButton(_ sender: Any) {
        performSegue(withIdentifier: "showReset", sender: sender)
    }
    
    @IBAction func TabBarButton(_ sender: Any) {
        performSegue(withIdentifier: "TabBarSegue", sender: sender)
        
       
    }
    
    // end of the test zone
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        
    }
    
    
    
}

