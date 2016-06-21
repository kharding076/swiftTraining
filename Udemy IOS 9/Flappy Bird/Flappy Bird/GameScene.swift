//
//  GameScene.swift
//  Flappy Bird
//
//  Created by Kyle Harding on 3/29/16.
//  Copyright (c) 2016 Kyle Harding. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var bird = SKSpriteNode()
    var bg = SKSpriteNode()
    var pipe1 = SKSpriteNode()
    var pipe2 = SKSpriteNode()
    
    enum ColliderType: UInt32{
        case Bird = 1
        case Object = 2
    }
    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        let bgTexture = SKTexture(imageNamed: "bg.png")
        
        let movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
        let replacebg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
        let movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg,replacebg]))
        
        
        
        for var i: CGFloat = 0; i<3; i++ {
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * i, y: CGRectGetMidY(self.frame))
            bg.size.height = self.frame.height
            bg.runAction(movebgForever)
            self.addChild(bg)
        }
        
        let birdTexture = SKTexture(imageNamed: "bird-01.png")
        let birdTexture2 = SKTexture(imageNamed: "bird-02.png")
        
        
        let animation = SKAction.animateWithTextures([birdTexture,birdTexture2], timePerFrame: 0.1)
        let makeBirdFlap = SKAction.repeatActionForever(animation)
        bird = SKSpriteNode(texture: birdTexture)
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height/2)
        bird.physicsBody!.dynamic = true
        
        
        
        bird.position =  CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bird.runAction(makeBirdFlap)
        
        bird.physicsBody!.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody!.contactTestBitMask = ColliderType.Object.rawValue
        bird.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
            
        self.addChild(bird)
        
    
        let ground = SKNode()
        ground.position = CGPointMake(0, 0)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width , 1))
        ground.physicsBody!.dynamic = false
        
        
        ground.physicsBody!.categoryBitMask = ColliderType.Object.rawValue
        ground.physicsBody!.contactTestBitMask = ColliderType.Object.rawValue
        ground.physicsBody!.collisionBitMask = ColliderType.Object.rawValue
        
        
        self.addChild(ground)
        
        
        
        
        _ = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("makePipes"), userInfo: nil, repeats: true)
        
        
        
       
        
      
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        print("Contact")
    }
    
    func makePipes(){
        
        let gapHeight = bird.size.height * 4
        let movementAmount = arc4random()  % UInt32(self.frame.size.height / 2)
        
        let pipeOffset = CGFloat(movementAmount) - (self.frame.size.height / 8)
        
        let movePipes = SKAction.moveByX(-self.frame.size.width * 2, y: 0, duration: NSTimeInterval( self.frame.width / 100))
        let removePipes = SKAction.removeFromParent()
        
        let moveAndRemovePipes = SKAction.sequence([movePipes,removePipes])
        

        let pipeTexture = SKTexture(imageNamed: "PipeDown2.png")
        pipe1 = SKSpriteNode(texture: pipeTexture)
        pipe1.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipeTexture.size().height + gapHeight / 2 + pipeOffset)
        pipe1.runAction(moveAndRemovePipes)
        self.addChild(pipe1)
        
        let pipe2Texture = SKTexture(imageNamed: "PipeUp2.png")
        pipe2 = SKSpriteNode(texture: pipe2Texture)
        pipe2.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) - pipe2Texture.size().height - gapHeight / 2 + pipeOffset)
        pipe2.runAction(moveAndRemovePipes)
        
        self.addChild(pipe2)

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       bird.physicsBody!.velocity = CGVectorMake(0, 0)
       bird.physicsBody!.applyImpulse(CGVectorMake(0, 10))
        
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
