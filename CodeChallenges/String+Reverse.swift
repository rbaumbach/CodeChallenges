import Foundation

extension String {
    // MARK: - Public Methods
    
    func classicReverse() -> String {
        var reversedString = ""

        for char in self {
            reversedString = "\(char)" + reversedString
        }

        return reversedString
    }
    
    func swiftyReverse() -> String {
        var reversedString = ""
        
        for char in self.reversed() {
            reversedString.append(char)
        }
        
        return reversedString
    }
    
    func functionalReverse() -> String {
        return self.reduce("") { reversedString, char in
            return "\(char)" + reversedString
        }
    }
    
    func stackReverse() -> String {
        let stack = Stack<String>()
        
        for char in self {
            stack.push(item: "\(char)")
        }
        
        var reversedString = ""

        while !stack.isEmpty() {
            reversedString += stack.pop()!
        }
        
        return reversedString
    }
}
