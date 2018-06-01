import XCTest
@testable import SwiftRedux

final class SwiftReduxTests: XCTestCase {
    private struct TestState {
        var value: Int
    }
    private var store: Store<TestState, Int>!
    
    override func setUp() {
        let reducer: Reducer<TestState, Int> = Reducer({ (state, action) -> TestState in
            var copyState = state
            copyState.value = action
            return copyState
        })
        store = Store(reducer: reducer, initialState: TestState(value: 10))
    }
    
    
    /// Test the initial value of the state is correct
    func testInitialValue() {
        XCTAssertEqual(store.currentState.value, 10)
    }
    
    
    /// Test that dispatching a new value propogates to the current state
    func testUpdateValue(){
        XCTAssertEqual(store.currentState.value, 10)
        store.dispatch(22)
        XCTAssertEqual(store.currentState.value, 22)
    }
    
    
    /// Ensure that updates are propogated to the subscribers
    func testSubscribersNotified(){
        // Dispatch an update without subscribing
        XCTAssertEqual(store.currentState.value, 10)
        store.dispatch(100)
        XCTAssertEqual(store.currentState.value, 100)
        
        // Now subscribe to the state
        // Should be notified of initial value
        
        var isFirstCall = true
        store.subscribe { (state) in
            if isFirstCall {
                XCTAssertEqual(state.value, 100)
                isFirstCall = false
            } else {
                XCTAssertEqual(state.value, 42)
            }
        }
        
        // Now test that when state is changed, subscribers are still notified
        store.dispatch(42)
    }
    
    /// Ensure updates are propogated to all subscribers
    func testMultipleSubscribers(){
        store.dispatch(42)
        store.subscribe { (state) in
            XCTAssertEqual(state.value, 42)
        }
        
        store.subscribe { (state) in
            XCTAssertEqual(state.value, 42)
        }
    }


    static var allTests = [
        ("testInitialValue", testInitialValue),
        ("testUpdateValue", testUpdateValue),
        ("testSubscribersNotified", testSubscribersNotified),
        ("testMultipleSubscribers", testMultipleSubscribers),
    ]
}
