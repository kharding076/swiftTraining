//
//  ViewController.swift
//  Swipes and Shakes
//
//  Created by Kyle Harding on 9/21/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func swiped(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.Right:
                 print("Swiped Right")
                
            case UISwipeGestureRecognizerDirection.Up:
                print("Swiped up")
                
            default:
                break
            }
        }
    }

    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake{
            print("device was shaken")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

