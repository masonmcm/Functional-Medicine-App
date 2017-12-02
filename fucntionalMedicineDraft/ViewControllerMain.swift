import UIKit

class ViewControllerMain: UIViewController {
    
    
    @IBOutlet var buttonArray: [UIButton]!
    var buttonIdentifier = [UIButton: String]()
    var buttonTitle = String()
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        buttonTitle = buttonIdentifier[sender]!
        if buttonTitle == "How to begin" {
             performSegue(withIdentifier: "segueHowToBegin", sender: self)
        } else {
             performSegue(withIdentifier: "segueTransition", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "segueTransition"{
            let secondController = segue.destination as! ViewControllerTransition
            secondController.labelToBeDisplayed = buttonTitle
            secondController.sender = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttonArray {
        let b = button.accessibilityLabel!
        buttonIdentifier.updateValue(b, forKey: button)
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

