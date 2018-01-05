import UIKit

class ViewControllerTransition: UIViewController {
    
    let customFont = UIFont(name: "Raleway-Thin", size: 17)
    @IBOutlet weak var enterTextField: UITextField!
    @IBOutlet var supplementLabels: [UIImageView]!
    var labelIdentifier = [String: UIImageView]()
    var labelToBeDisplayed = String()
    var didGoBack = true
    var sender: Any? = nil
    let supplementUnits: [String: String] = ["A": "mcg (micrograms)", "D": "ng (nanograms)", "C": "mg (milligrams)", "K": "ng (nanograms)", "M": "mg (milligrams)"]
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindToVCT(segue:UIStoryboardSegue) {
        enterTextField.text = nil
    }
    
    @IBAction func enter(_ sender: Any) {
        if enterTextField.text != ""{
            performSegue(withIdentifier: "segueResults", sender: self)
            makePlaceholderText()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueResults"){
            if (Double(enterTextField.text!) != nil) {
                let secondController = segue.destination as! ViewControllerResults
                secondController.supplement = supplementGenerator()
            } else {
                createAlert()
            }
        }
    }

    func supplementGenerator() -> Supplement{
        return Supplement(supplement: labelToBeDisplayed, input: Double(enterTextField.text!)!)
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
            makePlaceholderText()
            labelIdentifier[labelToBeDisplayed]!.isHidden = false
        }
    }
    
    func determineDidGoBack(sender: Any?) {
        if(sender != nil && sender is ViewControllerMain) {
            didGoBack = false
        }
    }
    
    func makePlaceholderText() {
        let splitVitaminName = labelToBeDisplayed.components(separatedBy: " ")
        let tempVitaminNameInit = splitVitaminName[splitVitaminName.count - 1]
        let tempVitaminNameFinal = tempVitaminNameInit[tempVitaminNameInit.startIndex]
        let vitaminName = String(tempVitaminNameFinal)
        enterTextField.placeholder = "Enter " + labelToBeDisplayed + " levels in " + supplementUnits[vitaminName]!
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

