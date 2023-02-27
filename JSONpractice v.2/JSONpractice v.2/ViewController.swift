//
//  ViewController.swift
//  JSONpractice v.2
//
//  Created by Арсентий Халимовский on 26.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        // tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // call our API manager with singleton
        // don't forget to upgrade function to get data here
        // values - it's mean all this numbers of the temperature which we got from API
        // weak self mean get data and save it
        // weak self also must have when you work with any data from the Network
        APIManager.shared.getWeather { [weak self] values in
            // let's head to the main queue to reload data because we can do it only here
            DispatchQueue.main.async {
                // seems like we again wan't to check is there a data or not
                guard let self else { return }
                // if there is a data let's assign our local property and give to it this data
                self.temperatureData = values
                // and reload our table view with a new data each time when you parse it
                self.tableView.reloadData()
            }
            
        }
        // if status code equal to 200 it's mean we got the data correctly
    }
    
    // MARK: - Private properties
    private var tableView = UITableView()
    // this property we use to hold temperature numbers from API so we can use it in our Table View
    private var temperatureData: [Double] = []


}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temperatureData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        // use local property of parsed data and define our tableViewCell properties
        // don't forget about indexPath.row - it's mean each line of the table view
        cell.textLabel?.text = "\(temperatureData[indexPath.row])"
        return cell
    }
    
    // so i should define each property of parsed data of the news in New's Free API and only after define properties here
    
}
