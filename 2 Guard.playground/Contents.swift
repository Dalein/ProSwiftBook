import UIKit


/// ## 1
/**
 The first use is the most obvious: `guard` is used for early returns, which means you exit a function if some preconditions are not satisfied.
 */

block(isActive: false) {
    
    func giveAward(to name: String) {
        guard name == "Taylor Swift" else {
            return print("No way!")
        }
        
        print("Congratulations, \(name)!")
    }
    
    giveAward(to: "Taylor Swift")
    
}


/// ## 2
/**
 The second use of guard is a happy side effect of the first: using guard and early returns allows you to **reduce your indent level**.
 */


/// ## 3
/**
 The third thing that `guard` brings us is a visibility increase for the **happy path**. This is a common concept in software design and testing, and refers to the path that your code will take when no exceptions or errors happen.
 */


/// ## 4
/**
When you use `guard` to check and unwrap an optional, that optional stays in scope.
 */


/// ## 5
/**
 `guard` lets you exit any scope if preconditions fail, not just functions and methods.
 */
block(isActive: true) {
    
    for i in 1...100 {
        guard i % 8 == 0 else { continue }
        print(i)
    }
    
    /// **Note: ** or the same with `where`:
    for i in 1...100 where i % 8 == 0 {
        print(i)
    }
    
}
