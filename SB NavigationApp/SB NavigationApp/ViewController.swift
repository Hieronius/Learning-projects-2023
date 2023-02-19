//
//  ViewController.swift
//  SB NavigationApp
//
//  Created by Арсентий Халимовский on 18.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var detail = DetailViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func useSegue(_ sender: Any) {
        performSegue(withIdentifier: "showDetail", sender: sender)
        
        detail.testVariable = 5
        print(detail.testVariable)
    }

}

