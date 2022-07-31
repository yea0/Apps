//
//  ViewController.swift
//  Catch The Snoop
//
//  Created by Yea on 29.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var snoop1: UIImageView!
    @IBOutlet weak var snoop2: UIImageView!
    @IBOutlet weak var snoop3: UIImageView!
    @IBOutlet weak var snoop4: UIImageView!
    @IBOutlet weak var snoop5: UIImageView!
    @IBOutlet weak var snoop6: UIImageView!
    @IBOutlet weak var snoop7: UIImageView!
    @IBOutlet weak var snoop8: UIImageView!
    @IBOutlet weak var snoop9: UIImageView!

    //variable
    var timer = Timer()
    var counter = 0
    var score = 0
    var snoopArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Data Saver
        let savedHigh = UserDefaults.standard.object(forKey: "HighScore")
        if savedHigh == nil {
            highScore = 0
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        if let high = savedHigh as? Int {
            highScore = high
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        //Gesture Recognizer
        snoop1.isUserInteractionEnabled  = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        snoop1.addGestureRecognizer(gestureRecognizer)
        
        snoop2.isUserInteractionEnabled = true
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        snoop2.addGestureRecognizer(gestureRecognizer2)
        
        snoop3.isUserInteractionEnabled = true
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        snoop3.addGestureRecognizer(gestureRecognizer3)
        
        snoop4.isUserInteractionEnabled = true
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        snoop4.addGestureRecognizer(gestureRecognizer4)
        
        snoop5.isUserInteractionEnabled = true
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        snoop5.addGestureRecognizer(gestureRecognizer5)
        
        snoop6.isUserInteractionEnabled = true
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        snoop6.addGestureRecognizer(gestureRecognizer6)
        
        snoop7.isUserInteractionEnabled = true
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        snoop7.addGestureRecognizer(gestureRecognizer7)
        
        snoop8.isUserInteractionEnabled = true
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        snoop8.addGestureRecognizer(gestureRecognizer8)
        
        snoop9.isUserInteractionEnabled = true
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        snoop9.addGestureRecognizer(gestureRecognizer9)
        
        snoopArray = [snoop1,snoop2,snoop3,snoop4,snoop5,snoop6,snoop7,snoop8,snoop9]
        
       
        
        //Timer
        counter = 25
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(hideSnoop), userInfo: nil, repeats: true)
        
        hideSnoop()
    }
    
   @objc func hideSnoop(){
        
        for hide in  snoopArray {
            hide.isHidden = true
        }
        
        let randomSnoop = Int(arc4random_uniform(UInt32(snoopArray.count - 1)))
        snoopArray[randomSnoop].isHidden = false
        
            
    }
    
    @objc func gestureFunc () {
        
        score += 1
        
        scoreLabel.text = "Score: \(score)"
       
    }
   
    
    @objc func timerFunc () {
        timeLabel.text = "\(counter)"
        counter -= 1
        
        //High Score
        if self.score > self.highScore {
            self.highScore = self.score
            highScoreLabel.text = "High Score: \(highScore)"
            UserDefaults.standard.set(self.highScoreLabel.text!, forKey: "HighScore")
        }
        
        if counter == -1 {
            //Alert
            let alert = UIAlertController(title: "Time's Out", message: "Do you want to play again ?", preferredStyle: UIAlertController.Style.alert)
            self.present(alert, animated: true, completion: nil)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.score = 0
                self.counter = 25
                self.scoreLabel.text = "Score: \(self.score)"
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunc), userInfo: nil, repeats: true)
                
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.hideSnoop), userInfo: nil, repeats: true)
                
                
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            
            //Timer
            timer.invalidate()
            hideTimer.invalidate()
            for hide in  snoopArray {
                hide.isHidden = true
            }
        }
        
    }
}

