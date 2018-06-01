# SwiftRedux

This is a basic implementation of a Redux-style state store in Swift. I started this as part of my WWDC18 submission.

The tool is made up of two key components, a `Reducer` and a `Store`. The concept is simple: keep the current application state in the `Store`, and make updates as necessary using the reducer. You create _subscribers_ which get notified of any changes to the state (as well as the state when they're first assigned!).



### Getting Started

SwiftRedux uses [Swift Package Manager](https://swift.org/package-manager/) to automate the process of downloading and linking the framework. An example is included in the repo, however the following `Package.swift` should get you up and running:

```swift
// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NameOfPackage",
    dependencies: [ 
        .package(url: "https://github.com/jaylees14/SwiftRedux", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "NameOfPackage",
            dependencies: ["SwiftRedux"]),
    ]
)

```



### Interacting with the Store

The store is written with generics, allowing you to define the `State` and `Action` however fits with your project.



#### Initialisation

Creating the store requires two parameters, a reducer and the initial state of the application. 

```swift	
let store: Store<State, Action> = Store(reducer: reducer, initialState: initialState)
```

A reducer's job is to take the current state, as well as an action, and combine the two to produce a new state. An example might be:

```swift
let reducer: Reducer<State, Action> = Reducer { (state: State, action: Action) -> State in
    var copyState = state
	copyState.property = action
 	return copyState
)}
```

####  

#### Dispatching Actions

Now we have a store, we can dispatch actions and reduce them over the current state. 

```swift
store.dispatch(action)
```

This will trigger the reducer on the current state and modify it as necessary.



#### Subscribers

To be notified every time that the state is updated, we can use a subscriber:

```swift
store.subscribe { (state) in
	// Deal with the newly updated state                 
}
```

The subscriber is notified every time an action is dispatched **and** when it first subscribes to the store.



### Running the Example

To run the example, run the following commands in your terminal

```
$ git clone https://github.com/jaylees14/SwiftRedux.git
$ cd SwiftRedux/Examples/GameBoard
$ swift build
$ swift run
```

