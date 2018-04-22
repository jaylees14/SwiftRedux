import Foundation

public struct Reducer<S, A> {
    public typealias Reduce = (S, A) -> S
    public let reduce: Reduce
    
    public init(_ reduce: @escaping Reduce){
        self.reduce = reduce
    }
}
