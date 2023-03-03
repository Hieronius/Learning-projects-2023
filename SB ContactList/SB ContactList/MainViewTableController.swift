//
//  ViewController.swift
//  SB ContactList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//

import UIKit

class MainViewTableController: UITableViewController {
    
    static let shared = MainViewTableController()
    
    var usersArray = [Person]()
    
    var secondUsersArray = [Person]()
    
    
    var userName: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersArray = DataManager().getUsers()
        print(usersArray.count)
        for number in 0...(usersArray.count - 1) {
                    print(usersArray[number].firstName)
                }
        secondUsersArray = usersArray
        print(secondUsersArray.count)
        
//        sendData()
    }
    
    func sendData() {
        let vc = DescriptionTableViewController()
        vc.descriptionArray = self.usersArray
        print(vc.descriptionArray.count)
        print("ORDER IS DONE!!!")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailVC.phoneNumber = usersArray[indexPath.row].phoneNumber
        detailVC.emailAddress = usersArray[indexPath.row].emailAddress
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellData = usersArray[indexPath.row]
        cell.textLabel?.text = "\(cellData.firstName) \(cellData.lastName)"
        cell.textLabel!.font = UIFont(name: "system", size: 50)
        return cell
    }

}

