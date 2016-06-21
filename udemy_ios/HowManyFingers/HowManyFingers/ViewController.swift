//
//  ViewController.swift
//  HowManyFingers
//
//  Created by Kyle Harding on 7/27/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNumberGuess: UITextField!
    @IBOutlet weak var lblOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func guess(sender: AnyObject) {
        var randomNumber = arc4random_uniform(21)
        var numberGuessed = txtNumberGuess.text
        
        if String(randomNumber) == numberGuessed{
            lblOutput.text = "You are correct!"
        }else{
            lblOutput.text = "Nope the number is \(randomNumber)"
        }
    
    }
}

