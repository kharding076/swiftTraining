//
//  ViewController.swift
//  CatYears
//
//  Created by Kyle Harding on 7/23/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var txtHumanYears: UITextField!
    
    
    @IBAction func calculateYears(sender: AnyObject) {
        var humanYears = NSDecimalNumber(decimal: <#NSDecimal#>):txtHumanYears.text.decimalValue()!)
        var result = humanYears.decimal
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

