import UIKit

class ViewControllerMain: UIViewController {
    
    
    @IBOutlet var buttonArray: [UIButton]!
    var supplementNames = ["segueVitaminA", "segueVitaminD", "segueVitaminK2", "segueVitaminC", "segueMagnesium", "segueHowToBegin"]
    var index = Int();
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        index = buttonArray.index(of: sender)!
        print(index)
        if supplementNames[index] != "segueHowToBegin" {
            performSegue(withIdentifier: "segueTransition", sender: self)
        } else {
            performSegue(withIdentifier: "segueHowToBegin", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if supplementNames[index] != "segueHowToBegin" {
            let secondController = segue.destination as! ViewControllerTransition
            secondController.labelToBeDisplayed = supplementNames[index]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

