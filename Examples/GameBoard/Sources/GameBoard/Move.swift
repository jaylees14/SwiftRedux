//
//  Move.swift
//  GameBoard
//
//  Created by Jay Lees on 01/06/2018.
//

import Foundation

public class Move {
    typealias Coord = (row: Int, col: Int)
    var player: Player
    var location: Coord
    
    init(player: Player, location: Coord){
        self.player = player
        self.location = location
    }
}
