//
//  ViewController.swift
//  SB ContactList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//

import UIKit

class MainViewTableController: UITableViewController {
    
    var usersArray = DataManager().getUsers()
    
    
    
    var userName = "Alfred"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(usersArray.count)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as? DetailViewController
        detailVC?.phoneNumber = "89522928313"
        detailVC?.emailAddress = "uha@gmail.com"
        // title view section
        detailVC?.userTitle = userName
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

