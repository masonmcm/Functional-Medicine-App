import UIKit

class ViewControllerTransition: UIViewController {
    
    let customFont = UIFont(name: "Raleway-Thin", size: 17)
    @IBOutlet weak var enterTextField: UITextField!
    @IBOutlet var supplementLabels: [UIImageView]!
    var labelIdentifier = [String: UIImageView]()
    var labelToBeDisplayed = String()
    var didGoBack = true
    var sender: Any?
    lazy var supplement: Supplement = {
        if (Int(enterTextField.text!) != nil) {
            return Supplement(supplement: labelToBeDisplayed, input: Int(enterTextField.text!)!)
        }else{
            return Supplement(supplement: labelToBeDisplayed, input: 0)
        }
    }()
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enter(_ sender: Any) {
        if enterTextField.text != ""{
            performSegue(withIdentifier: "segueResults", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueResults"){
            if (Int(enterTextField.text!) != nil) {
                let secondController = segue.destination as! ViewControllerResults
                secondController.supplement = supplement
                secondController.myString = enterTextField.text!
            } else {
                createAlert()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for label in supplementLabels {
            label.isHidden = true
            let l = label.accessibilityLabel!
            labelIdentifier.updateValue(label, forKey: l)
        }
        enterTextField.font = customFont;
        determineDidGoBack(sender: self.sender)
        if(!didGoBack) {
           labelIdentifier[labelToBeDisplayed]!.isHidden = false
        }
    }
    
    func determineDidGoBack(sender: Any?) {
        if(sender != nil && sender is ViewControllerMain) {
            didGoBack = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createAlert() { //makes alert for invalid input
        let alert = UIAlertController(title: "Invalid Input", message: "You must enter a number", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

