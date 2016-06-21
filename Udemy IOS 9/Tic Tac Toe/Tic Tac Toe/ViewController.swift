//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Kyle Harding on 9/2/15.
//  Copyright © 2015 Kyle Harding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTurn: UILabel!
    @IBOutlet weak var btnReset: UIButton!
  
  
    var activePlayer = 1
    var turn = 0
    var gameState = [0,0,0,0,0,0,0,0,0]
    var winningCombinations = [[0,1,2], [3,4,5,], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func resetGame(sender: AnyObject) {
        activePlayer = 1
        lblTurn.text = "Player \(activePlayer) You're Up!"
        gameState = [0,0,0,0,0,0,0,0,0]
        gameActive = true
        turn = 1
        btnReset.hidden = true
         var button: UIButton
         for var i=0; i < 9; i++ {
           button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
         }
        
    }
    
   
    @IBAction func buttonPressed(sender: AnyObject) {
        var title = ""
        if gameState[sender.tag] == 0 && gameActive == true{
            turn++
            gameState[sender.tag] =  activePlayer
            if activePlayer == 1{
                title = "O.png"
                activePlayer = 2
            
            }else{
                title = "x.png"
                activePlayer = 1
            }
            let playerTxt = "Player \(activePlayer) You're Up!"
            lblTurn.text = playerTxt
            let image = UIImage(named: title)
            sender.setImage(image, forState: .Normal)
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                    var winner = ""
                    if gameState[combination[0]] == 1{
                        winner = "Player 1"
                    }else{
                       winner = "Player 2"
                    }
                
                    
                    lblTurn.text = "\(winner) Has Won!"
                    gameActive = false
                    btnReset.hidden = false
                }
            }
            if turn == 10 && gameActive == true{
                lblTurn.text = "Cat's Game"
                gameActive = false
                btnReset.hidden = false
            }
        }
    }
}

