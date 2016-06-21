//
//  ViewController.swift
//  Core Data Demo
//
//  Created by Kyle Harding on 9/21/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
    /*    let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        newUser.setValue("Nathan", forKey: "username")
        newUser.setValue("nch", forKey: "id")
        
        do{
            try context.save()
        }catch{
            print("There is a problem")
        }

       */
        
        let request = NSFetchRequest(entityName: "Users")
        request.predicate = NSPredicate(format: "username = %@", "Sarah")
        request.returnsObjectsAsFaults = false
        do{
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let username = result.valueForKey("username") as? String{
                        print(username)
                    }
                    
                }
            }
        }catch{
            print("you screwed up Kyle")
        }
      
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

