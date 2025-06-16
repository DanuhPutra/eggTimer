//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggTime = ["Soft" : 5, "Medium" : 7, "Rare": 12]
    @IBAction func eggPressed(_ sender: UIButton) {
        let eggPressed = sender.currentTitle!
        let result = eggTime[eggPressed]!
        print(result)
        
    }
    

}
