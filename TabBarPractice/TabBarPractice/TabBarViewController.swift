//
//  TabBarViewController.swift
//  TabBarPractice
//
//  Created by Арсентий Халимовский on 12.03.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var arrayOfArticles = 0
    
    var login: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check is there an array of view controllers
        guard let viewControllers = viewControllers else { return }

        // all of our actions we should make in ViewDidLoad
        // probably i can make a specific method and just pass it to the view did load here
        // check each of the tab bar view controllers
        for viewController in viewControllers {
            
            // step 1 - reach the Navigation view controller which is part of the FeedViewController
            if let feedNavigationViewController = viewController as? FeedNavigationViewController {
                
                // step 2 - reach the Feed View Controller
                // seems like Navigation controller has the same property as TabBarControllers - viewControllers
                // this allows us to get access with code
                if let feedViewController = feedNavigationViewController.viewControllers.first as? FeedViewController {
                    
                    // step 3 - send our data to the final view controller
                    feedViewController.feedLogin = login
                    feedViewController.feedPassword = password
                }
            }
        }
    }
}

// if yes let's work with a specific view controller
// don't forget about NavigationViewControllers
//        for viewController in viewControllers {
//            if let feedNagivationViewController = viewController as? FeedNavigationViewController {
//                if let feedViewController = feedNagivationViewController.viewControllers.first as? FeedViewController {
//                    feedViewController.testVar = testLet
//                    print(feedViewController.testVar)
//                    print(feedViewController.testVar)
//                    print(feedViewController.testVar)
//                    print("adadawdawdawd")
//                    print("adadawdawdawd")
//                    print("adadawdawdawd")
//                }
//            }
//        }
