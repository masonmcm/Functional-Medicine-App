//
//  ViewControllerMain.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 10/29/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import UIKit

class ViewControllerMain: UIViewController {

    //identify which segue to perform
    @IBAction func segueVitaminD(_ sender: Any) {
        performSegue(withIdentifier: "segueVitaminD", sender: self)
    }
    
    @IBAction func segueMagnesium(_ sender: Any) {
        performSegue(withIdentifier: "segueOther", sender: self)
    }
    
    @IBAction func segueVitaminA(_ sender: Any) {
        performSegue(withIdentifier: "segueOther", sender: self)
    }
    
    @IBAction func segueVitaminK2(_ sender: Any) {
        performSegue(withIdentifier: "segueOther", sender: self)
    }
    
    @IBAction func segueVitaminC(_ sender: Any) {
        performSegue(withIdentifier: "segueOther", sender: self)
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
