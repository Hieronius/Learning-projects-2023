




import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    weak var mainViewControllerDelegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // some code here
        
    }
    
    @IBAction func sendAgeButtonPressed(_ sender: Any) {
        self.mainViewControllerDelegate?.getAge(age: ageTextField.text!)
        self.dismiss(animated: true)
    }
    
    
    @IBAction func sendNameButtonPressed(_ sender: Any) {
        self.mainViewControllerDelegate?.getName(name: nameTextField.text!)
        self.dismiss(animated: true)
    }
}
