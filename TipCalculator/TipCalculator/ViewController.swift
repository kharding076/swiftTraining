//
//  ViewController.swift
//  TipCalculator
//
//  Created by Kyle Harding on 7/5/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var customTipPercentageSlider: UISlider!
    @IBOutlet weak var customTipPercentageLabel1: UILabel!
    @IBOutlet weak var customTipPercentageLabel2: UILabel!
    @IBOutlet weak var tip15Label: UILabel!
    @IBOutlet weak var total15Label: UILabel!
    @IBOutlet weak var tipCustomLabel: UILabel!
    @IBOutlet weak var totalCustomLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    let decimal100 = NSDecimalNumber(string: "100.0")
    let decimal15Percent = NSDecimalNumber(string: "0.15")
    
    @IBAction func calculateTip(sender: AnyObject) {
       let inputString = inputTextField.text
        let sliderValue = NSDecimalNumber(integer: Int(customTipPercentageSlider.value))
        
        let customPercent = sliderValue.decimalNumberByDividingBy(decimal100)
        
        if sender is UISlider{
            customTipPercentageLabel1.text = NSNumberFormatter.localizedStringFromNumber(customPercent, numberStyle: NSNumberFormatterStyle.PercentStyle)
            
            customTipPercentageLabel2.text = customTipPercentageLabel1.text
            
        }
        
        if !inputString.isEmpty {
            let billAmount = NSDecimalNumber(string: inputString).decimalNumberByDividingBy(decimal100)
            
            if sender is UITextField{
                billAmountLabel.text = " " + formatAsCurrency(billAmount)
                let fifteenTip = billAmount.decimalNumberByMultiplyingBy(decimal15Percent)
                tip15Label.text = formatAsCurrency(fifteenTip)
                total15Label.text = formatAsCurrency(billAmount.decimalNumberByAdding(fifteenTip))
            }
            
            let customTip = billAmount.decimalNumberByMultiplyingBy(customPercent)
            tipCustomLabel.text = formatAsCurrency(customTip)
            totalCustomLabel.text = formatAsCurrency(billAmount.decimalNumberByAdding(customTip))
            
        }else{
            billAmountLabel.text = ""
            tip15Label.text = ""
            total15Label.text = ""
            tipCustomLabel.text = ""
            totalCustomLabel.text = ""
        }
        
    }
    
    func formatAsCurrency(number : NSNumber) -> String {
        return NSNumberFormatter.localizedStringFromNumber(number, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
    }
    
   
}

