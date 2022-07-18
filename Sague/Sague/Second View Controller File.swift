//
//  Second View Controller File.swift
//  Sague
//
//  Created by Paraf on 18.07.2022.
//  Copyright © 2022 Yasin. All rights reserved.
//

import UIKit

class Second_View_Controller_File: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    var name = ""
    var age = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageLabel.text! = age
        nameLabel.text! = name

    }
    

  

}
