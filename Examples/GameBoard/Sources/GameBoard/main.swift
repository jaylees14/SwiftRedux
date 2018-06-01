import SwiftRedux

class GameLogic {
    private let reducer: Reducer<GameState, Move>
    private let store: Store<GameState, Move>
    
    init(){
        //Create a reducer that updates the game board and returns the new state
        reducer = Reducer { (state: GameState, move: Move) -> GameState in
            var board = state.board
            board[move.location.col][move.location.row] = state.currentPlayer
            return GameState(board: board, previousMove: move)
        }
        
        //Define the initial game state with an empty board
        let emptyBoard: GameState.Board = Array(repeating: Array(repeating: nil, count: 10), count: 10)
        store = Store<GameState, Move>(reducer: reducer, initialState: GameState(board: emptyBoard, previousMove: nil))
        
        //Subscribe necessary methods to be notified when state changes
        store.subscribe(movePlayed)
    }
    
    //Public function allowing user to make a move
    public func makeMove(position: Move.Coord){
        store.dispatch(Move(player: store.currentState.currentPlayer, location: position))
    }
    
    //Subscriber to store, notified when state is updated
    private func movePlayed(_ state: GameState){
        guard let previousMove = state.previousMove else { return }
        print("Move made by \(previousMove.player) to position \(previousMove.location)")
    }
}

let gameLogic = GameLogic()
gameLogic.makeMove(position: (row: 0, col: 0))
gameLogic.makeMove(position: (row: 0, col: 1))
gameLogic.makeMove(position: (row: 0, col: 2))
gameLogic.makeMove(position: (row: 1, col: 1))
