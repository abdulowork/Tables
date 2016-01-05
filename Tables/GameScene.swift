//
//  GameScene.swift
//  Nardi
//
//  Created by Timofey on 1/3/16.
//  Copyright (c) 2016 Timofey. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let sampleRect = SKSpriteNode()
    var selection = false
    let myBoard = Board.init()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.backgroundColor = UIColor.init(red: 1, green: 0.5, blue: 0.5, alpha: 1)
        
        let tableWidthModifier = 0.02*frame.width
        let tableHeightModifier = 0.01*frame.height
        let tableWidth = (self.frame.width/12)-tableWidthModifier
        let tableHeight = (self.frame.height/2)-tableHeightModifier
        let tableX = (self.frame.width)/12
        let tableY = (self.frame.height/4)+tableHeightModifier/2
        let pieceY = (tableHeight/2)-tableWidth/2 //This is temporary!!!
        
        myBoard.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        
        
        for i in (-6)...(-1) {
            myBoard.addChild(Table.init(
                position: CGPoint(x: tableX*CGFloat(i)+(tableWidth+tableWidthModifier)/2, y: -tableY),
                size: CGSize(width: tableWidth, height: tableHeight)))
            myBoard.addChild(Table.init(
                position: CGPoint(x: tableX*CGFloat(i)+(tableWidth+tableWidthModifier)/2, y: tableY),
                size: CGSize(width: tableWidth, height: tableHeight)))
        }
        for i in (1)...(6) {
            myBoard.addChild(Table.init(
                position: CGPoint(x: tableX*CGFloat(i)-(tableWidth+tableWidthModifier)/2, y: -tableY),
                size: CGSize(width: tableWidth, height: tableHeight)))
            myBoard.addChild(Table.init(
                position: CGPoint(x: tableX*CGFloat(i)-(tableWidth+tableWidthModifier)/2, y: tableY),
                size: CGSize(width: tableWidth, height: tableHeight)))
        }
        
        var j = 1
        for table in myBoard.children {
            let lable = SKLabelNode(text: String(j))
            lable.fontColor = UIColor(red: 0.25, green: 0.25, blue: 0, alpha: 1)
            table.addChild(lable)
            j++
        }
        
        let workingTable = myBoard.children[0]
        let Piece1 = Piece(size: CGSize(width: tableWidth, height: tableWidth))
        workingTable.addChild(Piece1)
        let a = workingTable.children.count
        Piece1.position = CGPoint(x: 0, y: -pieceY+(a-1)*tableWidth+5)
        
//        let Piece2 = Piece(size: CGSize(width: tableWidth, height: tableWidth))
//        workingTable.addChild(Piece2)
//        Piece2.position = CGPoint(x: 0, y: -pieceY*CGFloat(workingTable.children.count)+5)
        
        self.addChild(myBoard)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        for touch in touches {
            let location = touch.locationInNode(self)
            var a = nodeAtPoint(location)
            if (a is Table) {
                a = (a as? Table)!
                print(a.name)
            }
//            print("X:%d | Y:%d", sampleRect.frame.midX, sampleRect.frame.midY)
//            print("X:%d | Y:%d", location.x, location.y)
//            for i in self.nodesAtPoint(location) {
//                print(i)
//            }
//            if (CGRectIntersectsRect(sampleRect.frame, CGRect(origin: location, size: CGSize(width: 1, height: 1))) && !selection) {
//                sampleRect.color = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
//                selection = true
//            }
//            else if (selection) {
//                sampleRect.color = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
//                sampleRect.position = location
//                selection = false
//            }
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
