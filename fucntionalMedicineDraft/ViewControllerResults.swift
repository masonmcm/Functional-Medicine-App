//
//  ViewControllerVitaminK2Results.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 11/4/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import UIKit

class ViewControllerResults: UIViewController {
    

    @IBOutlet weak var HighC: UITextView!
    @IBOutlet weak var LowC: UITextView!
    @IBOutlet weak var HighK2: UITextView!
    @IBOutlet weak var LowK2: UITextView!
    @IBOutlet weak var HighD: UITextView!
    @IBOutlet weak var LowD: UITextView!
    @IBOutlet weak var HighA: UITextView!
    @IBOutlet weak var LowA: UITextView!
    @IBOutlet weak var HighMag: UITextView!
    @IBOutlet weak var LowMag: UITextView!
    
    @IBOutlet var textViews: [UITextView]!
    var textViewIdentifierByLevel = [String: UITextView]()
    var textViewIdentifierBySupplement = [String: UITextView]()
    
    var myString = String()
    lazy var supplement: Supplement? = nil
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for text in textViews {
            text.isHidden = true
            var supplementName: String = ""
            var supplementLevel: String = ""
            var pastComma = false
            for character in text.accessibilityLabel! {
                if pastComma {
                    if character == " "{
                        continue
                    }
                }
                    if(character == ","){
                        pastComma = true
                    }else if !pastComma{
                        supplementName.append(character)
                    }else{
                        supplementLevel.append(character)
                    }
                }
            if(supplement!.supplementName == supplementName){
                 if(supplement!.levelOfTextDisplayed == "High" && supplementLevel == "High"){
                    text.isHidden = false
                 }else if (supplement!.levelOfTextDisplayed == "Low" && supplementLevel == "Low"){
                    text.isHidden = false
                 }else if(supplement!.levelOfTextDisplayed == "Average" && supplementLevel == "Average"){
                    text.isHidden = false
        }
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
