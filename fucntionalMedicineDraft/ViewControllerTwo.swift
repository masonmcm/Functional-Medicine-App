//
//  ViewControllerTwo.swift
//  fucntionalMedicineDraft
//
//  Created by Mason Mathew on 10/19/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var recievingLabel: UILabel!
    
    
    //MARK: Actions
    @IBAction func backButton(_ sender: Any) {
           dismiss(animated: true, completion: nil)
    }

    var myString = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recievingLabel.text = myString;
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
