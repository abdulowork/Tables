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
    var pieces = [Piece]()
    
    init(side: String) {
        self.side = side
    }
    
    func hasMoreTurns() -> Bool {
        var a = false
        for piece in pieces {
            if (self.side=="white") {
                for move in givenMoves {
                    if ((piece.getTableID()-move)>1) {
                        a = true
                    }
                }
            }
            if (self.side=="black") {
                for move in givenMoves {
                    if ((piece.getTableID()+move)<24) {
                        a = true
                    }
                }
            }
        }
        return (!givenMoves.isEmpty && a)
    }
    
    func controls(piece: Piece) -> Bool {
        return piece.side==side
    }
    
    func rollDice() -> [Int] {
        
        for _ in 0...1 {
            givenMoves.append(Int(arc4random_uniform(6) + 1))
        }
        if (givenMoves[0]==givenMoves[1]) {
            givenMoves.append(givenMoves[0])
            givenMoves.append(givenMoves[0])
        }

        givenMoves.sortInPlace()
        
        print(givenMoves)
        return givenMoves
        
    }
    
    private func movesSum() -> Int {
        var sum = 0
        for i in givenMoves {
            sum += i
        }
        return sum
    }
    
    private func isDoubles() -> Bool {
        let temp = givenMoves[0]
        for i in givenMoves {
            if (temp != i) {
                return false
            }
        }
        return true
    }
    
    private func removeFromMoves(num: Int) -> Bool {
        if (movesSum()==num) {
            givenMoves.removeAll()
            return true
        }
        if (isDoubles()) {
            var sum = givenMoves[0]
            for var i=0; i<givenMoves.count; i++ {
                if (sum==num) {
                    for _ in 1...i+1 {
                        givenMoves.removeLast()
                    }
                    return true
                }
                sum += givenMoves[0]
            }
        }
        else {
            for var i=0; i<givenMoves.count; i++ {
                if (givenMoves[i]==num) {
                    givenMoves.removeAtIndex(i)
                    return true
                }
            }
        }
        return false
    }
    
    //Moves piece from table to table and checks for all required conditions
    func go(fromTable: Table, toTable: Table) -> Bool {
        let goes = fromTable.id-toTable.id
        if (goes>0 && side=="white" && removeFromMoves(abs(goes))) {
            fromTable.movePiece(toTable)
            return true
        }
        if (goes<0 && side=="black" && removeFromMoves(abs(goes))) {
            fromTable.movePiece(toTable)
            return true
        }
        if (goes==0) {
            fromTable.movePiece(toTable)
            return true
        }
        return false
    }
    
}
