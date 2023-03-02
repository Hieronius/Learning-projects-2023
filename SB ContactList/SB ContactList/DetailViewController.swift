//
//  DetailViewController.swift
//  SB ContactList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    
    var phoneNumber = ""
    var emailAddress = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        phoneNumberLabel.text = phoneNumber
        emailAddressLabel.text = emailAddress
    }
}
