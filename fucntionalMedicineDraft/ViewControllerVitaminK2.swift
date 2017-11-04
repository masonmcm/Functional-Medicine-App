//
//  ViewControllerVitaminK2.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 11/4/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import UIKit

class ViewControllerVitaminK2: UIViewController {

    @IBOutlet weak var enterTextField: UITextField!
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enter(_ sender: Any) {
        if enterTextField.text != ""{
            performSegue(withIdentifier: "segueVitaminK2Results", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueVitaminK2Results"){
            if (Int(enterTextField.text!) != nil) { //input will be nil if a number is not input
                let secondController = segue.destination as! ViewControllerVitaminK2Results
                secondController.myString = enterTextField.text!
            } else {
                createAlert() //show alert if input is nil
            }
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
