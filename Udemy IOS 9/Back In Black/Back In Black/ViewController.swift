//
//  ViewController.swift
//  Back In Black
//
//  Created by Kyle Harding on 9/19/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBOutlet weak var time: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let audioPath = NSBundle.mainBundle().pathForResource("beethoven-2-1-4-pfaul", ofType: "mp3")!
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
        }catch{
            //print error
        }

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
           }

    @IBAction func play(sender: AnyObject) {
        player.play()
        time.value = player.
    }

    @IBAction func volume(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    @IBAction func stop(sender: AnyObject) {
        player.stop()
        
    }
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    
}

