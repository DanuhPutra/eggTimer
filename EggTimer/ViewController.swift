//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTime = ["Soft" : 3, "Medium" : 7, "Hard": 12]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var audioPlayer: AVAudioPlayer?
    @IBAction func eggPressed(_ sender: UIButton) {
        let eggPressed = sender.currentTitle!
        totalTime = eggTime[eggPressed]!
        timer.invalidate()
        progressBar.progress = 0.0
        secondPassed = 0
        titleLabel.text = eggPressed
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondPassed < totalTime {
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            print(Float(secondPassed) / Float(totalTime))
            
        } else {
            timer.invalidate()
            titleLabel.text = "Selesai!"
            playAlarmSound()
        }
    }
    
    func playAlarmSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error: tidak bisa memutar alaram!")
        }
    }
    

}
