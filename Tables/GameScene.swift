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
    
    lazy var myBoard : Board = {
        return Board(size: self.frame.size)
    }()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
//        myBoard.zRotation = CGFloat(M_PI)
        let frameScale = 1
        //print(pare.width)
        let tableWidthModifier = CGFloat(10)//0.02*frame.width
        let tableHeightModifier = 0.01*frame.height
        let tableWidth = CGFloat(115*frameScale)//(self.frame.width/12)-tableWidthModifier
        let tableHeight = (self.frame.height/2)-tableHeightModifier
        let tableX = CGFloat(125*frameScale)//(self.frame.width)/12
        let tableY = (self.frame.height/4)+tableHeightModifier/2
        //-(tableWidth+tableWidthModifier)
        myBoard.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        for i in (-6)...(-1) {
            myBoard.addChild(Table.init(
                position: CGPoint(x: tableX*CGFloat(i)-CGFloat(tableWidthModifier*CGFloat((abs(i)-1))), y: -tableY),
                size: CGSize(width: tableWidth, height: tableHeight),
                bottom: true
                ))
        }
        for i in (1)...(6) {
            myBoard.addChild(Table.init(
                position: CGPoint(x: tableX*CGFloat(i)+CGFloat(tableWidthModifier*CGFloat((abs(i)-1))), y: -tableY),
                size: CGSize(width: tableWidth, height: tableHeight),
                bottom: true
                ))
        }
        for var i=6; i>0; i-- {
            myBoard.addChild(Table.init(
                position: CGPoint(x: tableX*CGFloat(i)+CGFloat(tableWidthModifier*CGFloat((abs(i)-1))), y: tableY),
                size: CGSize(width: tableWidth, height: tableHeight),
                bottom: false
                ))
        }
        for var i=(-1); i>(-7); i-- {
            myBoard.addChild(Table.init(
                position: CGPoint(x: tableX*CGFloat(i)-CGFloat(tableWidthModifier*CGFloat((abs(i)-1))), y: tableY),
                size: CGSize(width: tableWidth, height: tableHeight),
                bottom: false
                ))
        }
        
        var j = 1
        for table in myBoard.children {
            let lable = SKLabelNode(text: String(j))
            lable.fontColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
            (table as! Table).id = j
            table.addChild(lable)
            j++
        }
        
//        let workingTableBottom = myBoard.children[0] as! Table
//        workingTableBottom.addPiece("black")
//        workingTableBottom.addPiece("black")
//        
//        let workingTableTop = myBoard.children[myBoard.children.count-1] as! Table
//        workingTableTop.addPiece("white")
//        workingTableTop.addPiece("white")
        
        //setting up the board
        for i in myBoard.children {
            let table = (i as! Table)
            switch table.id {
            case 1, 16:
                for _ in 1...2 {
                    table.addPiece(Piece(size: CGSize(width: 115, height: 115), side: "white"))
                }
            case 2, 17:
                for _ in 1...2 {
                    table.addPiece(Piece(size: CGSize(width: 115, height: 115), side: "black"))
                }
            default: "Nothing is created"
            }
        }
        
        print(currentPlayer().rollDice())
        
        self.addChild(myBoard)
    }
    
    var selectedTable = Table()
    var selection = false
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        for touch in touches {
            
//            if (currentPlayer().hasMoreTurns()) {
            let location = touch.locationInNode(self)
            let nodesWhereTouched = nodesAtPoint(location)
            print(currentPlayer().givenMoves)
            if (!selection) {
                for node in nodesWhereTouched {
                    if (node is Table) {
                        let table = node as? Table
                        if (table?.children.last is Piece) {
                            let piece = table?.children.last as! Piece
                            if (currentPlayer().controls(piece)) {
                                table?.selectTopPiece()
                                selectedTable = table!
                                selection = true
                            }
                        }
                    }
                }
            }
            
            else if (selection) {
                for node in nodesWhereTouched {
                    if (node is Table) {
                        let table = node as? Table
                        if (currentPlayer().go(selectedTable, toTable: table!)) {
                            selection = false
                            if (!currentPlayer().hasMoreTurns()) {
                                switchTurns()
                            }
                        }
                    }
                }
            }
                
//            }
//                
//            else {
//                switchTurns()
//            }
                
                      
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
    
    var turn = true
    
//    lazy var PlayerWhite : Player = {
//        return Player(side: "white")
//    }()
    var PlayerWhite = Player(side: "white")
//    lazy var PlayerBlack : Player = {
//        return Player(side: "black")
//    }()
    var PlayerBlack = Player(side: "black")
    
    func currentPlayer() -> Player {
        if (turn){
            return PlayerWhite
        }
        else {
            return PlayerBlack
        }
        
    }
    
    func switchTurns() {
        turn = !turn
        currentPlayer().rollDice()
        print(currentPlayer().side+" turn")
    }
}
