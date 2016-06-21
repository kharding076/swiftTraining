//
//  ViewController.swift
//  getDeviceToken
//
//  Created by Kyle Harding on 3/9/16.
//  Copyright © 2016 Kyle Harding. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtOutput: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getDeviceToken(sender: AnyObject) {
        
        /*let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "DeviceInfo")
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let token = result.valueForKey("deviceToken") as? String{
                        txtOutput.text = token
                    }
                }
                
            }
        }catch{
            print("you messed up")
        } */
        
         let tokenString = UIDevice.currentDevice().identifierForVendor!.UUIDString
         let phoneId  = UIDevice.currentDevice().name
        
        txtOutput.text = "\(tokenString),\(phoneId)"
        
    }

}

