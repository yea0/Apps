//
//  SecondScreen.swift
//  Sague and Note Taker
//
//  Created by Paraf on 19.07.2022.
//  Copyright © 2022 Yasin. All rights reserved.
//

import UIKit

class SecondScreen: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    var name = ""
    var birthday = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        birthdayLabel.text = birthday
        nameLabel.text = name
    }
    

  

}
