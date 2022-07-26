//
//  ViewController.swift
//  Gesture Recognizer App
//
//  Created by Yea on 26.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var isH8 = true

    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(changeView))
        firstImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changeView() {
        
        if isH8 == true {
            firstImageView.image = UIImage(named: "mentor")
            label.text = "Machine"
            isH8 = false
        }    else {
            firstImageView.image = UIImage(named: "h8")
            label.text = "H8"
            isH8 = true
                
        }
        
       
    }

}

