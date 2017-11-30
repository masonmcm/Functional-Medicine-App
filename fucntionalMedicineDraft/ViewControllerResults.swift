//
//  ViewControllerVitaminK2Results.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 11/4/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import UIKit

class ViewControllerResults: UIViewController {
    
    @IBOutlet weak var TVLow: UITextView!
    @IBOutlet weak var TVAverage: UITextView!
    @IBOutlet weak var TVHigh: UITextView!
    
    var myString = String()
    var supplement: Supplement? = nil
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let supplement_level = supplement?.level {
//            print(supplement_level)
//        }
        
        TVHigh.isHidden = true
        TVAverage.isHidden = true
        TVLow.isHidden = true
        
        //make user input into an Int
        let myStringToNum = Int(myString);
        //figure out which range the input is in
        if(myStringToNum! < 20) {
            //make Text fields visible based off range number is in
            TVLow.isHidden = false
        }
        else if(myStringToNum! > 50) {
            TVHigh.isHidden = false
        }
        else {
            TVAverage.isHidden = false
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
