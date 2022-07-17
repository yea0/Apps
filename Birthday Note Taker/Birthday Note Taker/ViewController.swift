//
//  ViewController.swift
//  Birthday Note Taker
//


import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var birthDayText: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthDayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let savedName = UserDefaults.standard.object(forKey: "name")
        let savedBirthday = UserDefaults.standard.object(forKey: "birthday")
        // casting as? vs as!
        if let savedName1 = savedName as? String {
            nameLabel.text = savedName1
            
        }
        if let savedBirthday1 = savedBirthday as? String {
            birthDayLabel.text = savedBirthday1
        }
    }

    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(nameText.text!, forKey: "name")
        UserDefaults.standard.set(birthDayText.text!, forKey: "birthday")
        nameLabel.text = "Name: \(nameText.text!)"
        birthDayLabel.text = "Birthday: \(birthDayText.text!)"
    }
    
}

