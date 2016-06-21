//
//  ViewController.swift
//  Example App
//
//  Created by Rob Percival on 15/12/2014.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myLabel: UILabel!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        myLabel.text = "It Worked"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

