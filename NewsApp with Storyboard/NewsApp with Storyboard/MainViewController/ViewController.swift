//
//  ViewController.swift
//  NewsApp with Storyboard
//
//  Created by Арсентий Халимовский on 13.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Tabbar", bundle: nil)
        let tabBarVC = storyboard.instantiateViewController(withIdentifier: "Tabbar")
        self.navigationController?.pushViewController(tabBarVC, animated: false)
    }


}

