//
//  ViewController.swift
//  SB TrackList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    
    // how much cells you wan't?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    // What cell should be displayed on the table view?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    }
    
    
}

