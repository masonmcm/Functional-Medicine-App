//
//  ViewControllerMagnesium.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 10/29/17.
//  Copyright © 2017 Gabi Stein. All rights reserved.
//

import UIKit

/*this controller is for all options besides VitaminD for now, it was
    just better to call it Magnesium Controller to make life easier in the future
*/
class ViewControllerMagnesium: UIViewController {

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
