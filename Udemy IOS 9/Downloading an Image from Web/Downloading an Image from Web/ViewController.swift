//
//  ViewController.swift
//  Downloading an Image from Web
//
//  Created by Kyle Harding on 9/21/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/9/98/Ironman_Australia_-_Swim_finish_-_E._Innocenti.JPG")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue()) { (reponse, data, error) -> Void in
            
            if error != nil{
                print(error)
            }else{
                if let tat = UIImage(data: data!){
                    self.image.image = tat
                    
                    let documentsDocumentry: String?
                    var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(<#T##directory: NSSearchPathDirectory##NSSearchPathDirectory#>, NSSearchPathDirectory.DocumentDirectory, expandTilde: Bool)
                }
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

