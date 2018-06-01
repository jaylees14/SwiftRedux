//
//  Player.swift
//  GameBoard
//
//  Created by Jay Lees on 01/06/2018.
//

import Foundation

public enum Player {
    case playerOne
    case playerTwo
    
    func other() -> Player {
        return self == .playerOne ? .playerTwo : .playerOne
    }
}
