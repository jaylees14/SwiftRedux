//
//  Reducer.swift
//  SwiftRedux
//
//  Created by Jay Lees on 01/06/2018.
//

import Foundation

public struct Reducer<S, A> {
    public typealias Reduce = (S, A) -> S
    public let reduce: Reduce
    
    public init(_ reduce: @escaping Reduce){
        self.reduce = reduce
    }
}
