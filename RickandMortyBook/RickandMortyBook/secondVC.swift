//
//  secondVC.swift
//  RickandMortyBook
//
//  Created by Yea on 20.08.2022.
//

import UIKit

class secondVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var selectedRickandMorty : rickandmorty?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedRickandMorty?.name
        jobLabel.text = selectedRickandMorty?.job
        imageView.image = selectedRickandMorty?.image
        
    }
    

 
}
