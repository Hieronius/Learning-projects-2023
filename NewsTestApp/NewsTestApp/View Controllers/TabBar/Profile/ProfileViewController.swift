//
//  ProfileViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
//    var userLogin = ""
//    var userPassword = ""
//    var userName = ""
    
    // color for text fields background color from Figma
    var textFieldColor = UIColor(displayP3Red: 117, green: 146, blue: 221, alpha: 0.1)
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameField: UITextField!
    @IBOutlet weak var profileEmailFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = 50
        
        profileNameField.layer.cornerRadius = 20
        profileNameField.layer.borderWidth = 0.5
        profileNameField.layer.borderColor = textFieldColor.cgColor
        profileNameField.layer.masksToBounds = true
        
        profileEmailFeild.layer.cornerRadius = 20
        profileEmailFeild.layer.borderWidth = 0.5
        profileEmailFeild.layer.borderColor = textFieldColor.cgColor
        profileEmailFeild.layer.masksToBounds = true
        
        profileImageView.image = testUser.userTestPhoto
        profileNameField.text = testUser.userName
        profileEmailFeild.text = testUser.userLogin
    
    }
    
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        // use unwind segue here plz
        
        let ac = UIAlertController(title: "Выход", message: "Вы уверены, что хотите выйти из аккаунта?", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Отмена", style: .default))
        ac.addAction(UIAlertAction(title: "Выйти", style: .destructive, handler: { action in
            self.performSegue(withIdentifier: "doUnwind", sender: self)
        }))
        
        self.present(ac, animated: true)
    }
}
