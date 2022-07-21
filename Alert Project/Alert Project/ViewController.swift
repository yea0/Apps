//
//  ViewController.swift
//  Alert Project
//
//  Created by Paraf on 21.07.2022.
//  Copyright © 2022 Yasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var passwordAgainText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.text = ""
        passwordText.text = ""
        passwordAgainText.text = ""
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if userNameText.text == "" {
                let alert = UIAlertController(title: "Error", message: "Enter Username", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK CHAMP", style: UIAlertAction.Style.cancel, handler: nil)
                alert.addAction(okButton)
            
                self.present(alert, animated: true, completion: nil)
            }
                else if passwordText.text == "" {
                    let alert = UIAlertController(title: "Error", message: "Enter Password", preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK CHAMP", style: UIAlertAction.Style.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }
                        else if passwordText.text != passwordAgainText.text {
                            let alert = UIAlertController(title: "Error", message: "Unmatched Password", preferredStyle: UIAlertController.Style.alert)
                            let okButton = UIAlertAction(title: "OK CHAMP", style: UIAlertAction.Style.cancel, handler: nil)
                            alert.addAction(okButton)
                            self.present(alert, animated: true, completion: nil)
                
                        }
                            else {
                                let alert = UIAlertController(title: "Signup", message: "Sucsess Signup", preferredStyle: UIAlertController.Style.alert)
                                let okButton = UIAlertAction(title: "FINNALY", style: UIAlertAction.Style.cancel, handler: nil)
                                alert.addAction(okButton)
                                                       
                                self.present(alert, animated: true, completion: nil)
            
                                }
    }
    
    

}
