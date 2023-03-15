//
//  ProfileViewController.swift
//  NewsTestApp
//
//  Created by Арсентий Халимовский on 23.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameField: UITextField!
    @IBOutlet weak var profileEmailFeild: UITextField!
    
    let backgroundColorForViewControllersFromFigma = UIColor(displayP3Red: 117, green: 146, blue: 221, alpha: 0.1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProfileImageView()
        setupProfileNameField()
        setupProfileEmailField()
    }
    
    func setupProfileImageView() {
        profileImageView.image = testUser.userTestPhoto
        profileImageView.layer.cornerRadius = 50
    }
    
    func setupProfileNameField() {
        profileNameField.text = testUser.userName
        profileNameField.layer.cornerRadius = 20
        profileNameField.layer.borderWidth = 0.5
        profileNameField.layer.borderColor = backgroundColorForViewControllersFromFigma.cgColor
        profileNameField.layer.masksToBounds = true
    }
    
    func setupProfileEmailField() {
        profileEmailFeild.text = testUser.userLogin
        profileEmailFeild.layer.cornerRadius = 20
        profileEmailFeild.layer.borderWidth = 0.5
        profileEmailFeild.layer.borderColor = backgroundColorForViewControllersFromFigma.cgColor
        profileEmailFeild.layer.masksToBounds = true
    }
    
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        let ac = UIAlertController(title: "Выход", message: "Вы уверены, что хотите выйти из аккаунта?", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Отмена", style: .default))
        ac.addAction(UIAlertAction(title: "Выйти", style: .destructive, handler: { action in
            self.performSegue(withIdentifier: "doUnwind", sender: self)
        }))
        self.present(ac, animated: true)
    }
}
