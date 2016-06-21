//
//  ViewController.swift
//  Is It Prime
//
//  Created by Kyle Harding on 7/28/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNumberInput: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func isItPrime(sender: AnyObject) {
        var numberInt = txtNumberInput.text.toInt()
        
        if numberInt != nil {
            
            var unwrappedNumber = numberInt!
            
            var isPrime = true
            
            if unwrappedNumber == 1 {
                
                isPrime = false
                
            }
            
            if unwrappedNumber != 2 && unwrappedNumber != 1 {
                
                for var i = 2; i < unwrappedNumber; i++ {
                    
                    if unwrappedNumber % i == 0 {
                        
                        isPrime = false
                        
                    }
                    
                }
                
            }
            
            if isPrime == true {
                
                lblResult.text = "\(unwrappedNumber) is prime!"
                
            } else {
                
                lblResult.text = "\(unwrappedNumber) is not prime!"
                
            }
            
            
            
        } else {
            
             lblResult.text = "Please enter a number in the box"
            
        }
        
    }
}

