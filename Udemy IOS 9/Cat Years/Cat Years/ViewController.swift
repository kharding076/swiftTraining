//
//  ViewController.swift
//  Cat Years
//
//  Created by Kyle Harding on 8/24/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtYears: UITextField!
    @IBOutlet weak var lblCatYears: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(sender: AnyObject) {
       var catAge = Int(txtYears.text!)!
        catAge = catAge * 7
        lblCatYears.text = "Your cat is \(catAge)"
        
    }

}

