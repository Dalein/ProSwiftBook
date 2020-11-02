import UIKit

/**
 If you’re transforming a collection, but you don’t need to access all the elements right away (or at all), you may be able to save cycles and allocations by using the lazy family of collection types
 */

struct User {
    let name: String
    let bio: String
}

struct UserCellViewModel {
    let userName: String
    let userBio: NSAttributedString
}

func formatBioString(_ bio: String) -> NSAttributedString {
    // pretend that here some heavy formating operations
    NSAttributedString(string: bio)
}


let users = [
    User(name: "John", bio: "Know nothing"),
    User(name: "Sam", bio: "Know everything")
]

let userCellData = users.lazy.map({ UserCellViewModel(userName: $0.name,
                                                      userBio: formatBioString($0.bio)) })


