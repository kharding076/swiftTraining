//
//  ViewController.swift
//  Animations
//
//  Created by Kyle Harding on 9/1/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    let total = 3;
    var current = 1;
    var timer = NSTimer()
    var isAnimating = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateImage(sender: AnyObject) {
        if isAnimating == true{
            timer.invalidate()
            isAnimating = false
        }else{
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            isAnimating = true
            
        }

     
        
        
    }
    
    func doAnimation(){
        image.image = UIImage(named: "f\(current).png")
        if current == total{
            current = 1
        }else{
            current++
        }
        
    }
    
   /*
    override func viewDidLayoutSubviews() {
        image.center = CGPointMake(image.center.x-400, image.center.y)
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, animations:  { () -> Void in
            self.image.center = CGPointMake(self.image.center.x+400, self.image.center.y)
        })
    }
*/
}

