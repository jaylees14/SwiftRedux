//
//  Store.swift
//  SwiftRedux
//
//  Created by Jay Lees on 01/06/2018.
//

import Foundation

public class Store<S, A> {
    private let reducer: Reducer<S,A>
    private var subscribers: [(S) -> Void]
    public private(set) var currentState: S {
        didSet {
            subscribers.forEach { $0(self.currentState) }
        }
    }
    
    public init(reducer: Reducer<S, A>, initialState: S) {
        self.reducer = reducer
        self.currentState = initialState
        self.subscribers = []
    }
    
    public func dispatch(_ action: A) {
        self.currentState = reducer.reduce(currentState, action)
    }
    
    public func subscribe(_ subscriber: @escaping (S) -> Void){
        subscribers.append(subscriber)
        subscriber(currentState)
    }
}
