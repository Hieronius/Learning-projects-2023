

import UIKit



protocol MainViewControllerDelegate: AnyObject {
    func getAge(age: String)
    func getName(name: String)
}

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ageSegue" || segue.identifier == "nameSegue" {
            let secondVC = segue.destination as? SecondViewController
            secondVC?.mainViewControllerDelegate = self
        }
    }
    
    
    @IBAction func ageButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "ageSegue", sender: sender)
    }
    
    
    @IBAction func nameButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "nameSegue", sender: sender)
    }
}


extension MainViewController: MainViewControllerDelegate {
    func getAge(age: String) {
        ageLabel.text = age
    }
    func getName(name: String) {
        nameLabel.text = name
    }
}
