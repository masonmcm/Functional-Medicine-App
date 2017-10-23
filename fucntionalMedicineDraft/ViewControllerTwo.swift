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
        //reset all text fields and make invisible if back button is hit
        TFLessThan20.isHidden = true
        TFGreaterThan50.isHidden = true
        TFAverage.isHidden = true
        dismiss(animated: true, completion: nil)
    }
    
    //hook up three UITextViews (one for each potential result)
    @IBOutlet weak var TFLessThan20: UITextView!
    @IBOutlet weak var TFGreaterThan50: UITextView!
    @IBOutlet weak var TFAverage: UITextView!
    
    
    var myString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //make all of the texts fields invisible to start
        TFLessThan20.isHidden = true
        TFGreaterThan50.isHidden = true
        TFAverage.isHidden = true
       
        //make user input into an Int
        let myStringToNum = Int(myString);
        //figure out which range the input is in
        if(myStringToNum! < 20) {
            //make Text fields visible based off range number is in
            TFLessThan20.isHidden = false
        }
        else if(myStringToNum! > 50) {
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
