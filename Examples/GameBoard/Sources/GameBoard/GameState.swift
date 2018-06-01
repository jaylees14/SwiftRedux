//
//  GameState.swift
//  GameBoard
//
//  Created by Jay Lees on 01/06/2018.
//

import Foundation

public class GameState {
    typealias Board = [[Player?]]
    var board: Board
    var previousMove: Move?
    var currentPlayer: Player
    
    init(board: Board, previousMove: Move?){
        self.board = board
        self.previousMove = previousMove
        self.currentPlayer = previousMove?.player.other() ?? .playerOne
    }
}
