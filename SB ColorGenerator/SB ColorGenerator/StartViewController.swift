

import UIKit

protocol StartViewControllerDelegate: AnyObject {
    func update(color: UIColor)
}

class StartViewController: UIViewController {
    
    var startBackGroundColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        view?.backgroundColor = startBackGroundColor
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGenerator" {
            let generatorVC = segue.destination as? ViewController
            generatorVC?.startViewDelegate = self
        }
    }
    
    
    
    
    @IBAction func barButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "showGenerator", sender: sender)
    }
    
}

extension StartViewController: StartViewControllerDelegate {
    func update(color: UIColor) {
        view.backgroundColor = color
    }
}
