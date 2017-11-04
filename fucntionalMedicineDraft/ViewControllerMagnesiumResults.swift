//
//  ViewControllerMagnesiumResults.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 11/3/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import UIKit

class ViewControllerMagnesiumResults: UIViewController {
    
    @IBOutlet var TVAverage: UIView!
    
    var myString = String()
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TVAverage.isHidden = true
        //make user input into an Int
        let myStringToNum = Int(myString);
        if(myStringToNum! < 20) {
            //make Text fields visible based off range number is in
           TVAverage.isHidden = false
        }
        else if(myStringToNum! > 50) {
            TVAverage.isHidden = false
        }
        else {
            TVAverage.isHidden = false
        }
        //figure out which range the input is in

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
