//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediumTime = 7
//    let HardTime = 12
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
//    var secondsRemaining = 60
    
    var timer = Timer()
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
//        progressBar.progress = 1.0
        
        progressBar.progress = 0.0
        secondsPassed = 0
       
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        titleLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
        
        @objc func updateTimer() {
            if secondsPassed < totalTime {
                
                secondsPassed += 1
                progressBar.progress = Float(secondsPassed) / Float(totalTime)

            }
            else {
                timer.invalidate()
                titleLabel.text = "DONE!"
            }
            
        }
    
    

}
