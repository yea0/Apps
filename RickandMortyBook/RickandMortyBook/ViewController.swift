//
//  ViewController.swift
//  RickandMortyBook
//
//  Created by Yea on 20.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var myRickandMorty = [rickandmorty]()
    var chosenCharacter : rickandmorty?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        //Rick and Morty Object
        
        let rick = rickandmorty(Initname: "Rick", Initjob: "Scientist", Initimage: UIImage(named: "rick")!)
        
        let morty = rickandmorty(Initname: "Morty", Initjob: "Student", Initimage: UIImage(named: "morty")!)
        
        let beth = rickandmorty(Initname: "Beth", Initjob: "Veterinary Sergeon", Initimage: UIImage(named: "beth")!)
        
        let summer = rickandmorty(Initname: "Summer", Initjob:"Cursed Antique Store", Initimage: UIImage(named: "summer")!)
        
        let jerry = rickandmorty(Initname: "Jerry", Initjob: "Unemployed", Initimage: UIImage(named: "jerry")!)
        
        myRickandMorty.append(rick)
        myRickandMorty.append(morty)
        myRickandMorty.append(beth)
        myRickandMorty.append(summer)
        myRickandMorty.append(jerry)
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = myRickandMorty[indexPath.row].name
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myRickandMorty.count
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCharacter = myRickandMorty[indexPath.row]
        
        self.performSegue(withIdentifier: "secondVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            let destinationVC = segue.destination as! secondVC
            destinationVC.selectedRickandMorty = chosenCharacter
        }
    }
    
}

