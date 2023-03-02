//
//  ViewController.swift
//  SB TrackList
//
//  Created by Арсентий Халимовский on 02.03.2023.
//

import UIKit

class TrackViewController: UITableViewController {
    
    // now variable contains the function from our Model
    var trackList = Track.getTrackList()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // how much cells you wan't?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackList.count
    }
    
    // What cell should be displayed on the table view?
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let track = trackList[indexPath.row]
        cell.textLabel?.text = track.song
        cell.textLabel?.font = UIFont(name: "system", size: 50)
        cell.detailTextLabel?.text = track.artist
        cell.detailTextLabel?.font = UIFont(name: "system", size: 30)
        cell.imageView?.image = UIImage(named: track.track)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }


}

//extension ViewController: UITableViewDataSource {
//
//    // how much cells you wan't?
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        10
//    }
//
//    // What cell should be displayed on the table view?
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // create a reusable cell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Cell index: \(indexPath.row)"
//        return cell
//    }
//
//
//}

