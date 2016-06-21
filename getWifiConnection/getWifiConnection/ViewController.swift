//
//  ViewController.swift
//  getWifiConnection
//
//  Created by Kyle Harding on 3/7/16.
//  Copyright © 2016 Kyle Harding. All rights reserved.
//

import UIKit

import SystemConfiguration.CaptiveNetwork



class ViewController: UIViewController {

    @IBOutlet weak var outputTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func getSSID(sender: AnyObject) {
        
        
            var currentSSID = "NOT ON WIFI"
            if let interfaces:CFArray! = CNCopySupportedInterfaces() {
                for i in 0..<CFArrayGetCount(interfaces){
                    let interfaceName: UnsafePointer<Void> = CFArrayGetValueAtIndex(interfaces, i)
                    let rec = unsafeBitCast(interfaceName, AnyObject.self)
                    let unsafeInterfaceData = CNCopyCurrentNetworkInfo("\(rec)")
                    if unsafeInterfaceData != nil {
                        let interfaceData = unsafeInterfaceData! as Dictionary!
                        currentSSID = interfaceData["SSID"] as! String
                    }
                }
            }
        if currentSSID == "certified" {
           outputTxt.text = "on sherwin network"
        }else{
            outputTxt.text = "not on network"
        }
    
        


        
    }
   
    
    }