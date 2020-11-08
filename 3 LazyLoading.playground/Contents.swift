import UIKit

/**
    **Lazy properties** are the middle ground (between regular properties and functions): they are properties that are calculated only once and stored, but never calculated if they aren’t used. So if your code uses a lazy property repeatedly you only pay the performance cost once, and if they are never used then the code is never run.
 */
block(isActive: false) {
    
    class Singer {
        let name: String
        
        init(name: String) {
            self.name = name
        }
        
        lazy var reversedName = {
            "\(String(self.name.uppercased().reversed()))"
        }()
    }


    let taylor = Singer(name: "Taylor Swift")
    print(taylor.reversedName)

}



/// ## Lazy singletons
block(isActive: false) {
    
    class MusicPlayer {
        init() {
            print("Ready to play songs!")
        }
    }

    class Singer {
        static let musicPlayer = MusicPlayer()
        
        init() {
            print("Creating a new singer")
        }
    }

    let taylor = Singer()
    /// at this point we'll only see **Creating a new singer**
    
    /// and only after this:
    Singer.musicPlayer
    
    /**
    **Ready to play songs!** will print.
    All Swift `static let/var` singletons are automatically lazy – they only get created when they are needed.
     */
    
}



/// ### Lazy sequences


// naive Fibonacci function impl:
func fibonacci(of num: Int) -> Int {
    guard num > 2 else {
//        print("num: \(num)")
        return num
    }
   
    let res = fibonacci(of: num - 1) + fibonacci(of: num - 2)
//    print("res: \(res)")
    return res
}


block(isActive: false) {
    // 0 | 0
    // 1 | 1
    // 2 | 2
    // 3 | 3
    // 4 | 5
    // 5 | 8
    // 6 | 13
    // 7 | 21
    // 8 | 34
    // 9 | 55
    fibonacci(of: 6)
    
    
    let fibonacciSequence = (0...20).map(fibonacci)
    print(fibonacciSequence[10])
    
    /// with this fibonacci `return` was called 17697 times.
}


/**
 This is where **lazy sequences** come into play: you give it a sequence to work with and tell it what code you want to run just like you would with a normal sequence, but now that **code is executed on demand as you access items**. So, we could prepare to generate the first 200 numbers in the Fibonacci, then only use the 20th value by using the lazy property of a sequence:
 */
block(isActive: true) {

    let lazyFibonacciSequence = Array(0...199).lazy.map(fibonacci)
    print(lazyFibonacciSequence[19])
    
    
    /**
    **Note:**  `lazy sequences` have no memoization, which means requesting the same data twice will require the work to be done twice.
     */
    
}
