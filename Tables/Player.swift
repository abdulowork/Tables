//
//  Player.swift
//  Tables1
//
//  Created by Timofey on 1/8/16.
//  Copyright © 2016 Timofey. All rights reserved.
//

import SpriteKit

class Player {
    var side = String()
    var givenMoves = [Int]()
    
    init(side: String) {
        self.side = side
    }
    
    func hasMoreTurns() -> Bool {
        return !givenMoves.isEmpty
    }
    
    func controls(piece: Piece) -> Bool {
        return piece.side==side
    }
    
    
}
