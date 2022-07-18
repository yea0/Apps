//
//  ViewController.swift
//  Sague
//
//  Created by Paraf on 18.07.2022.
//  Copyright © 2022 Yasin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userName = ""
    var userAge = ""

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var ageText: UITextField!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func nextPageButton(_ sender: Any) {
        
        userName = nameText.text!
        userAge = ageText.text!
        
        performSegue(withIdentifier: "toSecondScreen", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondScreen" {
            let toSecondScreen = segue.destination as! Second_View_Controller_File
            toSecondScreen.age = userAge
            toSecondScreen.name = userName
            
        }
    }
    
}

