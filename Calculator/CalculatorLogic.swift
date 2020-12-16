//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by alexis on 15/12/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    private var intermediateCalculation: (n: Double, c: String)?
    private var acc = 0.0
    
    mutating func calculate(number: Double, calcMethod: String) -> Double! {
        
        switch calcMethod {
        case "AC":
            acc = 0
            return 0
        case "+/-":
            return number * -1
        case "%":
            return number / 100
        case "+":
            acc += number
            intermediateCalculation = (n: acc, c: calcMethod)
            return acc
        case "×":
            acc *= number
            intermediateCalculation = (n: acc, c: calcMethod)
            return acc
        case "=":
            let tempNum = acc
            acc = 0
            return performFinalCalculation(number)
        default:
            fatalError("The operation passed in does not match any of the cases.")
        }
        
        return nil
    }
    
    func performFinalCalculation(_ number2: Double) -> Double! {
        if let number1 = intermediateCalculation?.n, let calcMethod = intermediateCalculation?.c {
            switch calcMethod {
            case "+":
                return number1 + number2
            case "-":
                return number1 - number2
            case "×":
                return number1 * number2
            case "÷":
                return number1 / number2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
