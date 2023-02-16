//
//  TabbarController.swift
//  NewsApp with Storyboard
//
//  Created by Арсентий Халимовский on 15.02.2023.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // there we wan't to hide "back" button
        // and there we should define a name of the screen;
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Title"
    }
}
