import UIKit


/// ## Basic switch statement
block(isActive: false) {
    
    let name = "twostraws"

    switch name {
    case "bilbo":
        print("Hello, Bilbo Baggins")
    case "twostaws":
        print("Hello, Paul Hudson")
    default:
        print("Authentication failed")
    }
    
}


/// ## Work with 2 values:
block(isActive: false) {
    /**
     In this instance, both parts of the tuple must match the case in order for it to be executed.
     */

    let authCredentials = (name: "twostraws",
                           password: "fr0st1es")

    switch authCredentials {
    case ("bilbo", "bagg1n5"):
        print("Hello, Bilbo Baggins")
    case ("twostraws", "fr0st1es"):
        print("Hello, Paul Hudson")
    default:
        print("Who are fucking you?")
    }
}


/// # Partial matches
block(isActive: false) {
    
    /**
     “When working with tuples, there are some occasions when you want a partial match: you care what some values are but don’t care about others. In this situation, use underscores to represent “any value is fine”:
     */
    
    let authentication = (name: "twostraws", password: "fr0st1es",
                          ipAddress: "127.0.0.1")
    
    switch authentication {
    case ("bilbo", "bagg1n5", _):
        print("Hello, Bilbo Baggins")
    case ("twostraws", "fr0st1es", _):
        print("Hello, Paul Hudson")
    default:
        print("Who are fucking you?")
    }

    /**
        **Remember:** Swift will take the first matching case it finds, so you need to ensure you look for the most specific things first.
     */
    
    
    /**
     Finally, if you want to match only part of a tuple, but still want to know what the other part was, you should use let syntax.
     */

    switch authentication {
    case ("bilbo", "bagg1n5", _):
        print("Hello, Bilbo Baggins!")
    case ("twostraws", let password, _):
        print("Hello, Paul Hudson: your password was \(password)!")
    default:
        print("Who are you?")
    }
    
}


/// # Matching calculated tuples
block(isActive: false) {
    
    /*
     To give you a practical example, consider the “fizzbuzz” test: write a function that accepts any number, and returns “Fizz” if the number is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “FizzBuzz” if its evenly divisible by 3 and 5, or the original input number in other cases.
     */

    func fizzbuzz(number: Int) -> String {
        switch (number % 3 == 0, number % 5 == 0) {
        case (true, true):
            return "FizzBuzz"
        case (true, false):
            return "Fizz"
        case (false, true):
            return "Buzz"
        case (false, false):
            return "\(number)"
        }
    }

    print(fizzbuzz(number: 15))
}


/// # Loops
block(isActive: false) {

    let twostraws = (name: "twostraws", password: "fr0st1es")
    let bilbo = (name: "bilbo", password: "bagg1n5")
    let taylor = (name: "taylor", password: "fr0st1es")

    let users = [twostraws, bilbo, taylor]

    for user in users {
        print("\(user.name)\n")
    }


    for case let (name, password) in users {
        print("\(name): \(password)")
    }


    /**
     That filters the users array so that only items with the password “fr0st1es” will be used in the loop, then creates a name constant inside the loop for you to work with.
     */

    for case let (name, "fr0st1es") in users {
        print("User \(name) has this password")
    }
    
}


/// # Matching optionals
block(isActive: false) {
    let data: [Any?] = ["Bil", nil, 69, "Ted"]

    for case let datum? in data {
        print(datum)
    }
    
}


/// # Matching enums and associated values
block(isActive: false, title:"Basic enum matching:") {
    
    enum WeatherType {
        case cloudy
        case sunny
        case windy
    }

    let today: WeatherType = .cloudy

    switch today {
    case .cloudy:
        print("It's cloudy")
    case .windy:
        print("It's windy")
    default:
        print("It's sunny")
    }

    // or basic conditional statements like this:
    if today == .cloudy {
        print("It's cloudy")
    }

}


block(isActive: false) {
    
    /**
     As soon as you add associated values, things get more complicated because you can use them, filter on them, or ignore them depending on your goal.
     */
    
    enum WeatherType {
        case cloudy(coverage: Int)
        case sunny
        case windy
    }
    
    let today: WeatherType = .cloudy(coverage: 95)
    
    
    /// ### Not using associated value
    
    switch today {
    case .cloudy:
        print("It's cloudy")
    case .windy:
        print("It's windy")
    default:
        print("It's sunny")
    }
    
    
    /// ### Using associated value
    
    switch today {
    case .cloudy(let coverage):
        print("It's cloudy with \(coverage)")
    case .windy:
        print("It's windy")
    default:
        print("It's sunny")
    }
    
    
    /// `where` keyword
    
    switch today {
    
    case .cloudy(let coverage) where coverage == 100:
        print("You must live in the Saint Setersburg")
    case .cloudy(let coverage):
        print("it's cloudy with \(coverage)")
        
    case .windy:
        print("It's windy")
    case .sunny:
        print("It's sunny")
    }
    
    
    // with ranges:
    
    switch today {
    
    case .cloudy(let coverage) where coverage == 0:
        print("You must live in Death Valley")
    case .cloudy(let coverage) where (1...50).contains(coverage):
        print("It's a bit cloudy, with \(coverage)% coverage")
    case .cloudy(let coverage) where (51...99).contains(coverage):
        print("It's very cloudy, with \(coverage)% coverage")
    case .cloudy(let coverage) where coverage == 100:
        print("You must live in the Saint Setersburg")
    case .cloudy(let coverage):
        print("it's cloudy with \(coverage)")
    
    case .windy:
        print("It's windy")
    case .sunny:
        print("It's sunny")
    }
    
    LF()
    
    
    // in a loop:
    
    let forecast: [WeatherType] = [.cloudy(coverage: 40),
                                   .sunny, .windy,
                                   .cloudy(coverage: 100),
                                   .sunny]
    
    for case let .cloudy(coverage) in forecast {
      print("It's cloudy with \(coverage)% coverage")
    }
    
    LF()
    
    for case .cloudy(40) in forecast {
        print("It's cloudy with 40% coverage")
    }
    
}


// ## Matching types
block(isActive: false) {
    
    let someView: AnyObject = UIButton()
    
    switch someView {
    case is UIView:
        print("Found a view")
    case is UIButton:
        print("Found a button")
    case is UILabel:
        print("Found a label")
    case is UISwitch:
        print("Found a switch")
    default:
        print("Found something else")
    }
    
    LF()
    
    /**
     Will print **found a view** because `UIButton` is subclass of `UIView`.
     Probadly this is not what we want.
     */
    
    
    /// More usefull example:
    
    let view = UIView()
    view.addSubview(UILabel())
    view.addSubview(UIButton())
    view.addSubview(UIButton())
    view.addSubview(UIView())
    view.addSubview(UILabel())
    view.addSubview(UITableView())
    
    for label in view.subviews where label is UILabel {
        print("Found a label with frame: \(label.frame)")
    }
    
    /** Even though `where` ensures only `UILabel` objects are processed in the loop, it doesn’t actually do any typecasting.
     
        This do:
     */
    
    for case let label as UILabel in view.subviews {
        print("Found a label with text: \(String(describing: label.text))")
    }
    
}


/// `where` keyword
block(isActive: true) {
    
    let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    for number in numbers where (number % 2 == 1) {
        print(number)
    }
    
    LF()
    
    
    let celebrities = ["Michael Jackson", "Taylor Swift", "Michael Caine", "Adele Adkins", "Michael Jordan"]

    for name in celebrities where !name.hasPrefix("Michael") {
        print(name)
    }
    
    LF()
    
    let celebritiesWithOptionals: [String?] = ["Michael Jackson",
                                               nil,
                                               "Michael Caine",
                                               nil,
                                               "Michael Jordan"]
    /**
     When that runs, **name** will only contain the strings that had values, so its output will be:
     */
    for case let name? in celebritiesWithOptionals {
        print(name)
    }
    
}
