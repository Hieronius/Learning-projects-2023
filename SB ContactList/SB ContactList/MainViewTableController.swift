//
//  ViewController.swift
//  SB ContactList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//

import UIKit

class MainViewTableController: UITableViewController {
    
    
    var userName = "Alfred"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as? DetailViewController
        detailVC?.phoneNumber = "89522928313"
        detailVC?.emailAddress = "uha@gmail.com"
        // title view section
        detailVC?.userTitle = userName
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Check"
        cell.textLabel!.font = UIFont(name: "system", size: 50)
        return cell
    }

}

