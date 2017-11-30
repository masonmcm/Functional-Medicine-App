import UIKit

class ViewControllerTransition: UIViewController {
    
    @IBOutlet weak var enterTextField: UITextField!
    
    var labelToBeDisplayed = String()
    var supplementNames = ["segueVitaminK2", "segueVitaminC", "segueVitaminD", "segueVitaminA", "segueMagnesium"]
    lazy var supplement = Supplement(supplement: labelToBeDisplayed)
    var didGoBack = true
    var sender: Any?
    
    @IBOutlet var supplementLabels: [UIImageView]!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enter(_ sender: Any) {
        if (enterTextField.text != "") {
            performSegue(withIdentifier: "segueResults", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueResults"){
            if (Int(enterTextField.text!) != nil) { //input will be nil if a number is not input
                let secondController = segue.destination as! ViewControllerResults
                supplement.level = Int(enterTextField.text!)!
                secondController.supplement = supplement
                secondController.myString = enterTextField.text!
            } else {
                createAlert() //show alert if input is nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = 0
        while (count < supplementNames.count) {
            supplementLabels[count].isHidden = true
            count += 1
        }
        
        determineDidGoBack(sender: self.sender)
        if(!didGoBack) {
            supplementLabels[supplementNames.index(of: supplement.supplementName)!].isHidden = false
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

