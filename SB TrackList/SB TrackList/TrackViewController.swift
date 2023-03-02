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
        
        // add system edit bar button
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! TrackDetailViewController
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailVC.track = trackList[indexPath.row]
        
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
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        // delete "delete" button from "edit" mode
        .none
    }

    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        // delete place for possible buttons so the view will not change it's position
        false
    }
    
    // this method allowes us to touch and grab the element and throw it into another place 
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // sourceIndexPath and destinationIndexPath is already defined as IndexPath data type
        // 1. grab the element from it's first position
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        // 2. throw this element to the different position
        trackList.insert(currentTrack, at: destinationIndexPath.row)
    }

}



