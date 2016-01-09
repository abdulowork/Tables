//
//  SKStack.swift
//  Nardi
//
//  Created by Timofey on 1/3/16.
//  Copyright © 2016 Timofey. All rights reserved.
//

import SpriteKit

class Table: SKSpriteNode {
    
    var bottom = Bool()
    var id = Int()
    var p_num = Int()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(position: CGPoint, size: CGSize, bottom: Bool) {
        let texture = SKTexture()
        super.init(texture: nil, color: UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.3), size: size)
        self.position = position
        self.bottom = bottom
    }
    
    init() {
        let texture = SKTexture()
        super.init(texture: nil, color: UIColor.init(red: 1, green: 1, blue: 1, alpha: 0), size: CGSize())
    }
    
    func addPiece(side: String) {
        let a = Piece(size: CGSize(width: self.frame.width, height: self.frame.width), side: side)
        addChild(a)
        
        if bottom {
            let y1 = self.frame.minY-self.position.y+a.frame.height/2+24
            let y2 = (a.frame.height)*CGFloat((self.children.count-2)) //Scaling factor for number of pieces in a table, replace with another logic
            a.position = CGPoint(x: 0, y: y1+y2)
        }
        else {
            let y1 = self.frame.maxY-self.position.y-a.frame.height/2-28
            let y2 = (a.frame.height)*CGFloat((self.children.count-2)) //Scaling factor for number of pieces in a table
            a.position = CGPoint(x: 0, y: y1-y2)
        }
        p_num++
    }
    
//    func canAcceptPiece(piece: Piece) {
//        if ()
//    }
    
    func removePiece() -> Piece? {
        let piece = self.children.last
        if (piece is Piece) {
            self.children.last?.removeFromParent()
            return (piece as! Piece)
        }
        return nil
    }
    
    func selectTopPiece() -> Bool {
        if (self.children.last is Piece) {
            let a = (self.children.last as! Piece)
            a.color = UIColor.init(red: 0, green: 0, blue: 1, alpha: 1)
            switch a.side {
                case "white":
                a.texture = SKTexture(imageNamed: "piece_white_selected")
                case "black":
                a.texture = SKTexture(imageNamed: "piece_black_selected")
            default: break
            }
            a.selected = true
            return true
        }
        return false
    }
    
    func deselectTopPiece() -> Bool {
        if (self.children.last is Piece) {
            let a = (self.children.last as! Piece)
            a.color = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
            switch a.side {
            case "white":
                a.texture = SKTexture(imageNamed: "piece_white_normal")
            case "black":
                a.texture = SKTexture(imageNamed: "piece_black_normal")
            default: break
            }
            a.selected = false
            return true
        }
        return false
    }
}