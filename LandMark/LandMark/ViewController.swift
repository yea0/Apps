//
//  ViewController.swift
//  LandMark
//
//  Created by Yea on 6.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    //Arrays
    
    var landmark = [String]()
    var landmarkImage = [UIImage]()
    var chosenLandmark = ""
    var chosenLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //Call a Tableview function
        tableView.delegate = self
        tableView.dataSource = self
        
        //Arrays Data
        
        landmark.append("Big Sur Bridge")
        landmark.append("Sphinx")
        landmark.append("Sydney Opera House")
        landmark.append("Tas Kopru")
        
        landmarkImage.append(UIImage(named: "bigsurbridge")!)
        landmarkImage.append(UIImage(named: "sphinx")!)
        landmarkImage.append(UIImage(named: "sydneyoperahouse")!)
        landmarkImage.append(UIImage(named: "taskopru")!)
        
        //Navigation Title
        navigationItem.title = "Landmark"
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmark.remove(at: indexPath.row)
            landmarkImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmark[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return landmark.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmark = landmark[indexPath.row]
        chosenLandmarkImage = landmarkImage[indexPath.row]
        
        performSegue(withIdentifier: "toSecondView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView" {
            let destination = segue.destination as! imageView
            destination.landMarkSelected = chosenLandmark
            destination.landMarkImageSelected = chosenLandmarkImage
            
        }
        
    }
    
    
    
}

