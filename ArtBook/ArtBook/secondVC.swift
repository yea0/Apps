//
//  secondVC.swift
//  ArtBook
//
//  Created by Yea on 26.08.2022.
//

import UIKit
import CoreData

class secondVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var chosenPainting = ""
    var chosenPaintingId : UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenPainting != "" {
            
            saveButton.isHidden = true
            
            
            //Core Data
            let appDelagate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelagate.persistentContainer.viewContext
            
            let fetchRequst = NSFetchRequest<NSFetchRequestResult>(entityName: "Paints")
            let idString = chosenPaintingId?.uuidString
            fetchRequst.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequst.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequst)
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject]{
                        
                        if let name = result.value(forKey: "name") as? String {
                            nameText.text = name
                        }
                        if let artist = result.value(forKey: "artist") as? String {
                            artistText.text = artist
                        }
                        if let year = result.value(forKey: "year") as? Int {
                            yearText.text = String(year)
                        }
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                    }
                }
            } catch {
                print("Failed")
            }
            
            
        } else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
        }
            
            
        //Recognizer
    
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(recognizer))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageRecognizerFunc))
        imageView.addGestureRecognizer(imageRecognizer)
        
    }
    
    @objc func imageRecognizerFunc() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func recognizer() {
        view.endEditing(true)
    }

    
    @IBAction func saveButton(_ sender: Any) {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let newPainting = NSEntityDescription.insertNewObject(forEntityName: "Paints", into: context)
        
        //Atributes
        newPainting.setValue(nameText.text!, forKey: "name")
        newPainting.setValue(artistText.text!, forKey: "artist")
        if let years = Int(yearText.text!) {
            newPainting.setValue(years, forKey: "year")
        }
        newPainting.setValue(UUID(), forKey: "id")
        let dataView = imageView.image?.jpegData(compressionQuality: 0.5)
        newPainting.setValue(dataView, forKey: "image")
        do {
            try context.save()
            print("Saved")
        }   catch {
            print("Failed")
        }
        
        self.navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(name: NSNotification.Name.init("newData"), object: nil)
        
        
    }
    
    
}
