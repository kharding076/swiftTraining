//
//  ViewController.swift
//  Timer
//
//  Created by Kyle Harding on 8/25/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var  timer = NSTimer()
    var secs = 0;
    var min = 0;
    var hours = 0;
    
    @IBOutlet weak var txtHrs: UITextField!
    @IBOutlet weak var txtMins: UITextField!
    @IBOutlet weak var txtSecs: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func play(sender: AnyObject) {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("count"), userInfo: nil, repeats: true)
    

    }
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        secs = 0
        min = 0
        hours = 0
        txtHrs.text = "\(hours)"
        txtMins.text = "\(min)"
        txtSecs.text = "\(secs)"
        
        
    }
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func count(){
        secs++
        if secs == 60 {
            min++
            secs = 0
        }
        
        if min == 60 {
            hours++
            min = 0
        }
        
        txtHrs.text = "\(hours)"
        txtMins.text = "\(min)"
        txtSecs.text = "\(secs)"
        
    }
}

