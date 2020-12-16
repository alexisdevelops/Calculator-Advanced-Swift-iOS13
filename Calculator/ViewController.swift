//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTypingNumber:Bool = true
    private var calculatorLogic = CalculatorLogic()
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!)
            else {
                fatalError("Cannot convert display label into a Double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            guard let calculatedValue = calculatorLogic.calculate(number: displayValue, calcMethod: calcMethod) else {
                fatalError("Calculation couldt no be completed")
            }
            displayValue = calculatedValue
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
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

