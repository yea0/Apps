//
//  ViewController.swift
//  Sague and Note Taker
//
//  Created by Paraf on 19.07.2022.
//  Copyright © 2022 Yasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var birthdayLabel: UITextField!
    
    var userName = ""
    var userBirthday = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName = nameLabel.text!
        userBirthday = birthdayLabel.text!
        let savedName = UserDefaults.standard.object(forKey: "name")
        let savedBirthday = UserDefaults.standard.object(forKey: "birthday")
        if let myName = savedName as? String {
            nameLabel.text = myName
        }
        if let myBirthday = savedBirthday as? String {
            birthdayLabel.text = myBirthday
        }
        
    }
    
    
    @IBAction func toScreenButton(_ sender: Any) {
       
        userName = nameLabel.text!
        userBirthday = birthdayLabel.text!
        
        performSegue(withIdentifier: "toSecondScreen", sender: nil)
        
    }
    
    @IBAction func saveButton(_ sender: Any) {
        userName = nameLabel.text!
        userBirthday = birthdayLabel.text!
        
        
        UserDefaults.standard.set(nameLabel.text!, forKey: "name")
        UserDefaults.standard.set(birthdayLabel.text!, forKey: "birthday")
    }
    
    @IBAction func deleteDataButton(_ sender: Any) {
        
        let unSavedName = UserDefaults.standard.object(forKey: "name")
        let unSavedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (unSavedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
        }
        if (unSavedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondScreen" {
            
            let destinationToSecondScreen = segue.destination as! SecondScreen
            destinationToSecondScreen.birthday = userBirthday
            destinationToSecondScreen.name = userName
        }
    }
    
}

