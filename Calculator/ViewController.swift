//
//  ViewController.swift
//  Calculator
//
//  Created by Jason Behnke on 5/29/17.
//  Copyright © 2017 Jason Behnke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentOperation: Operator = Operator.nothing
    
    var calcState: CalculationState = CalculationState.enteringNum
    
    var firstValue: String = ""
    
    // result label
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Button actions
    @IBAction func numberClicked(_ sender: UIButton) {
        updateDisplay (number: String(sender.tag))
    }
    
    func updateDisplay (number: String) {
        if calcState == CalculationState.newNumStarted {
            if let num = resultLabel.text {
                if num != " " {
                    firstValue = num
                }
            }
            calcState = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calcState == CalculationState.enteringNum {
            resultLabel.text = resultLabel.text! + number
        }
    }
    
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        calcState = CalculationState.newNumStarted
        
        if let num = resultLabel .text {
            if num != " " {
                firstValue = num
                resultLabel.text = " "
            }
        }
        
        updateOperatorButton(tag: sender.tag)
        
        switch sender.tag {
        case 10:
            currentOperation = Operator.add
        case 11:
            currentOperation = Operator.minus
        case 12:
            currentOperation = Operator.times
        case 13:
            currentOperation = Operator.divide
        default:
            return
        }
    }
    
    @IBAction func equalsClicked(_ sender: UIButton) {
        calculateSum ()
    
    }
    func calculateSum () {
        if (firstValue.isEmpty) {
            return
        }
        
        var result = " "
        
        if currentOperation == Operator.times {
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.divide {
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.add {
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.minus {
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        resultLabel.text = result
        calcState = CalculationState.newNumStarted
    }
    
    func updateOperatorButton (tag: Int) {
        //clear colors
        for i in 10..<14 {
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clear
            }
        }
        //change color
        if let button = self.view.viewWithTag(tag) as? UIButton {
            button.backgroundColor = UIColor.yellow
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

