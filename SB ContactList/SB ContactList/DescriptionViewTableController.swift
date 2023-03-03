//
//  DescriptionViewTableController.swift
//  SB ContactList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//

import UIKit

protocol DescriptionTableViewControllerDelegate: AnyObject {
    func getData(data: [Person])
}


class DescriptionTableViewController: UITableViewController {
    
    let mainSingleton = MainViewTableController.shared
    
    var descriptionArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.descriptionArray = self.mainSingleton.secondUsersArray
            print(self.descriptionArray.count)
            self.tableView.reloadData()
        }
        
    
        
        
        
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return descriptionArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
            let indexPath = descriptionArray[indexPath.row]
            cell.textLabel?.text = indexPath.phoneNumber
            cell.textLabel!.font = UIFont(name: "system", size: 80)
            return cell
        } else {
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "nextCell", for: indexPath)
            let indexPath = descriptionArray[indexPath.row - 1]
            secondCell.textLabel?.text = indexPath.emailAddress
            secondCell.textLabel!.font = UIFont(name: "system", size: 80)
            return secondCell
        }
    }
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
//        let indexPath = descriptionArray[indexPath.row]
//        cell.textLabel?.text = indexPath.phoneNumber
//        cell.detailTextLabel?.text = indexPath.emailAddress
//        cell.textLabel!.font = UIFont(name: "system", size: 80)
//        cell.detailTextLabel?.font = UIFont(name: "system", size: 50)
//        return cell
//    }
    
    // Great, it's working. Just need to customise
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        for sec in 0...(tableView.numberOfSections - 1) {
            
        }
        let sectionName: String
        switch section {
        case 0:
            sectionName = "\(descriptionArray[section].firstName) \(descriptionArray[section].lastName)"
        case 1:
            sectionName = "\(descriptionArray[section].firstName) \(descriptionArray[section].lastName)"
        default:
            sectionName = ""
        }
        return sectionName
    }
}
