//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTime = ["Soft" : 3, "Medium" : 7, "Hard": 12]
    var secondRemaining = 60
    var timer = Timer()
    @IBAction func eggPressed(_ sender: UIButton) {
        titleLabel.text = "How do you like your eggs?"
        progressBar.progress = 1.0
        timer.invalidate()
        let eggPressed = sender.currentTitle!
        secondRemaining = eggTime[eggPressed]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondRemaining > 0 {
            print("\(secondRemaining) seconds.")
            secondRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    

}
