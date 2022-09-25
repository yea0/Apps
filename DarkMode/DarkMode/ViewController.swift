//
//  ViewController.swift
//  DarkMode
//
//  Created by Yea on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let interfaceStayle = traitCollection.userInterfaceStyle
        
        if interfaceStayle == .dark {
            changeButton.tintColor = UIColor.purple
            
        } else {
            changeButton.tintColor = UIColor.blue
        }
        
        overrideUserInterfaceStyle = .dark
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let interfaceStayle = traitCollection.userInterfaceStyle
        
        if interfaceStayle == .dark {
            changeButton.tintColor = UIColor.purple
            
        } else {
            changeButton.tintColor = UIColor.blue
        }
        
    }


}

