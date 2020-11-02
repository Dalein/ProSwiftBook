import Foundation

public func block(isActive: Bool = true, title: String = "", code: ()->()) {
    guard isActive else { return }
    
    if title.isEmpty {
        print("\n")
    } else {
        print("\n\(title)\n")
    }

    code()
}


public func LF(count: Int = 1) {
//    for _ in (0..<count) {
        print("\n")
//    }
}
