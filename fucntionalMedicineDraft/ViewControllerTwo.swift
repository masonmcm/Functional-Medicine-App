//
//  ViewControllerTwo.swift
//  fucntionalMedicineDraft
//
//  Created by Mason Mathew on 10/19/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    //MARK: Actions
    @IBAction func backButton(_ sender: Any) {
        TFLessThan20.isHidden = true
        TFGreaterThan50.isHidden = true
        TFAverage.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var TFLessThan20: UITextView!
    @IBOutlet weak var TFGreaterThan50: UITextView!
    @IBOutlet weak var TFAverage: UITextView!
    
    
    var myString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TFLessThan20.isHidden = true
        TFGreaterThan50.isHidden = true
        TFAverage.isHidden = true
        let myStringToNum = Int(myString);
        if(myStringToNum! < 20) {
            //add text here for < 20 here
            TFLessThan20.isHidden = false
        }
        else if(myStringToNum! > 50) {
            //add text here for > 50 here
            TFGreaterThan50.isHidden = false
        }
        else {
           TFAverage.isHidden = false
        }
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
