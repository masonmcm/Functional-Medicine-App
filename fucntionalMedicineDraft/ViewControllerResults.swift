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
    lazy var supplement: Supplement? = nil
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TVHigh.isHidden = true
        TVAverage.isHidden = true
        TVLow.isHidden = true
        print(supplement?.levelOfTextDisplayed)
        if(supplement?.levelOfTextDisplayed == "High"){
            TVHigh.isHidden = false
        }else if(supplement?.levelOfTextDisplayed == "Low"){
            TVLow.isHidden = false
        }else{
            TVAverage.isHidden = false
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
