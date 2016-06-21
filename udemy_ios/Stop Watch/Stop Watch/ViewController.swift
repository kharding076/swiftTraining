//
//  ViewController.swift
//  Stop Watch
//
//  Created by Kyle Harding on 7/29/15.
//  Copyright (c) 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var counter = 0

    @IBOutlet var countingLabel: UILabel!
   
    
    @IBAction func clear(sender: AnyObject) {
        timer.invalidate()
        counter = 0
        countingLabel.text = String(counter)
    }
    
    @IBAction func start(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)

    }
    
    func updateCounter(){
        countingLabel.text = String(counter++)
    }
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         countingLabel.text = String(counter)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

