//
//  ViewController.swift
//  Timer App
//
//  Created by Yea on 27.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    var counter = 0
    @IBOutlet weak var timeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
            
        counter = 20
        timeLabel.text = "Timer: \(counter)"
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        }
    
    
    @objc func timerFunc () {
        timeLabel.text = "Timer: \(counter)"
        counter -= 1
            
        if counter == 0 {
            timer.invalidate()
            timeLabel.text = "Time's Over Boomer"
        }
    }
    /*override func viewDidAppear(_ animated: Bool) {
        
       counter = 20
        
        for time in 1...20 {
            counter = counter - 1
            timeLabel.text = ("Timer : \(counter)")
            Thread.sleep(forTimeInterval: 2)
                }
    }
    */
    @IBAction func testButton(_ sender: Any) {
        print("Hell no")
    }
    
}

