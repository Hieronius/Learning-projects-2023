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
    
    // i should define title of the view as current User Name
    
    var phoneNumber = ""
    var emailAddress = ""
    var userTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        phoneNumberLabel.text = phoneNumber
        emailAddressLabel.text = emailAddress
        title = userTitle
    }
}
