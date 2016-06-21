//
//  ViewController.swift
//  working with auto
//
//  Created by Kyle Harding on 9/15/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    var player: AVAudioPlayer = AVAudioPlayer()
   
    
    @IBAction func play(sender: AnyObject) {
         player.play()

    }

    @IBAction func pause(sender: AnyObject) {
        player.pause()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let audioPath = NSBundle.mainBundle().pathForResource("beethoven-2-1-4-pfaul", ofType: "mp3")!
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
           
        }catch{
            //print error
        }

    }

    @IBAction func volume(sender: AnyObject) {
        player.volume = slider.value
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

