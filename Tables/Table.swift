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
    
    func addPiece() {
        let a = Piece(size: CGSize(width: self.frame.width, height: self.frame.width))
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
    }
    
    func removePiece() {
        if (self.children.last is Piece) {
            self.children.last?.removeFromParent()
        }
    }
    
    func selectTopPiece() -> Bool {
        if (self.children.last is Piece) {
            let a = (self.children.last as! Piece)
            a.color = UIColor.init(red: 0, green: 0, blue: 1, alpha: 1)
            a.selected = true
            return true
        }
        return false
    }
    
    func deselectTopPiece() -> Bool {
        if (self.children.last is Piece) {
            let a = (self.children.last as! Piece)
            a.color = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1)
            a.selected = false
            return true
        }
        return false
    }
}