//
//  imageView.swift
//  LandMark
//
//  Created by Yea on 6.08.2022.
//

import UIKit

class imageView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landMarkName: UILabel!
    
    var landMarkSelected = ""
    var landMarkImageSelected = UIImage()
    
    override func viewDidLoad() {
        
        landMarkName.text = landMarkSelected
        
        imageView.image = landMarkImageSelected
        
        super.viewDidLoad()

    }
    

}
