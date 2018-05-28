//
//  ViewControllerVitaminK2Results.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 11/4/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import UIKit

class ViewControllerResults: UIViewController {
    

   
    @IBOutlet var textViews: [UIView]!
    @IBOutlet var imageViews: [UIImageView]!
    lazy var supplement: Supplement? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var textToBeDisplayed: UIView = UIView()
        var imageToBeDisplayed: UIImageView = UIImageView()
        
        for text in textViews {
            text.isHidden = true
            var supplementNameText: String = ""
            var supplementLevelText: String = ""
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
                        supplementNameText.append(character)
                    }else{
                        supplementLevelText.append(character)
                    }
                    if(supplement!.supplementName == supplementNameText &&
                        supplement!.levelOfTextDisplayed  == supplementLevelText) {
                        textToBeDisplayed = text
                }
            }
        }
            for label in imageViews {
                label.isHidden = true
                var supplementNameLabel: String = ""
                var supplementLevelLabel: String = ""
                var pastComma = false
                for character in label.accessibilityLabel! {
                    if pastComma {
                        if character == " "{
                            continue
                        }
                    }
                    if(character == ","){
                        pastComma = true
                    }else if !pastComma{
                        supplementNameLabel.append(character)
                    }else{
                        supplementLevelLabel.append(character)
                    }
                if(supplement!.supplementName == supplementNameLabel &&
                    supplement!.levelOfTextDisplayed  == supplementLevelLabel) {
                    imageToBeDisplayed = label
                }
            }
        }

        textToBeDisplayed.isHidden = false
        imageToBeDisplayed.isHidden = false
        
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
