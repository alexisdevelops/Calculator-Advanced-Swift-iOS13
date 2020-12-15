//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isFinishedTypingNumber:Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        guard let number = Double(displayLabel.text!)
        else {
            fatalError("Cannot convert display label into a Double")
        }
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "AC" {
                displayLabel.text = "0"
            }
            if calcMethod == "+/-" {
                displayLabel.text = String(number * -1)
            }
            if calcMethod == "%" {
                displayLabel.text = String(number / 100)
            }
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if  numValue == "." {
                    //TODO: Fix dot beign added twice
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label into a double !")
                    }
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

