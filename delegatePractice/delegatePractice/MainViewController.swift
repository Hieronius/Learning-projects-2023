

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var moodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
    }
    
    
    @IBAction func checkButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "showSecond", sender: sender)
    }
    
}
