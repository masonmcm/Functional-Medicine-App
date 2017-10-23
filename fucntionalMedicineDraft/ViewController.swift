//
//  ViewController.swift
//  fucntionalMedicineDraft
//
//  Created by Gabi Stein on 10/10/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Outlet
    //added random comments to commit
    @IBOutlet weak var enterTextField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    //MARK: Action
    @IBAction func enter(_ sender: Any) {
        if enterTextField.text != ""{
            performSegue(withIdentifier: "segueOne", sender: self)
        }
    }

    // ! operator means force unwrap
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! ViewControllerTwo
        secondController.myString = enterTextField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

