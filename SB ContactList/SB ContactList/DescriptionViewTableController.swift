//
//  DescriptionViewTableController.swift
//  SB ContactList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//

import UIKit

class DescriptionViewTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
        cell.textLabel?.text = "Alan"
        cell.detailTextLabel?.text = "Wake"
        cell.textLabel!.font = UIFont(name: "system", size: 80)
        cell.detailTextLabel?.font = UIFont(name: "system", size: 50)
        return cell
    }
    
    // Great, it's working. Just need to customise
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName: String
        switch section {
        case 0:
            sectionName = NSLocalizedString("Person1", comment: "mySectionName1")
        case 1:
            sectionName = NSLocalizedString("Person2", comment: "mySectionName2")
        default:
            sectionName = ""
        }
        return sectionName
    }
}
