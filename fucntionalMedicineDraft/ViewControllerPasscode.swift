//
//  ViewControllerPasscode.swift
//  fucntionalMedicineDraft
//
//  Created by Zachary Lintz on 1/14/18.
//  Copyright © 2018 Gabi Stein. All rights reserved.
//

import UIKit
import CryptoSwift

class ViewControllerPasscode: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passcodeTextField: UITextField!
    let password: [UInt8] = [19, 176, 228, 56, 143, 41, 246, 3, 151, 184, 235, 110, 172, 188, 31, 140]
    
    @IBAction func enterWasPressed(_ sender: Any) {
        
        passcodeTextField.resignFirstResponder()
        
        do {
            let aes = try AES(key: "3VrjNUpHGnAsC2LN", iv: "zPEklHzI5RvT9F7M") // aes128
            let ciphertext = try aes.encrypt(Array(passcodeTextField.text!.utf8))
        
            if ciphertext.toBase64()! == password.toBase64()! {
                performSegue(withIdentifier: "SegueToMainController", sender: self)
            }
            else {
                UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.passcodeTextField.center.x += 10
                }, completion: nil)
                
                UIView.animate(withDuration: 0.1, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.passcodeTextField.center.x -= 20
                }, completion: nil)
                
                UIView.animate(withDuration: 0.1, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.passcodeTextField.center.x += 10
                }, completion: nil)
            }
        }catch { }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passcodeTextField.delegate = self
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
