import Foundation

// You can see the TDD'd version of this file in the following repo:
// https://github.com/rbaumbach/AlgorithmsAndDataStructuresInSwift

class Stack<T: Equatable>: CustomStringConvertible {
    // MARK: - Private Properties
    
    private var linkedList = GenericSinglyLinkedList<T>()
    
    // MARK: - <CustomStringConvertible>
    
    var description: String {
        return constructStringRepresentation()
    }
    
    // MARK: - Public Methods
    
    func push(item: T) {
        linkedList.addToFront(item: item)
    }
    
    func pop() -> T? {
        return linkedList.removeFromFront()
    }
    
    func peek() -> T? {
        return linkedList.peek()
    }
    
    func isEmpty() -> Bool {
        return linkedList.isEmpty()
    }
    
    func clear() {
        linkedList.clear()
    }
    
    func forEach(_ body: (T) -> Void) {
        linkedList.forEach(body)
    }
    
    // MARK: - Private Methods
    
    private func constructStringRepresentation() -> String {
        var stringRepresentation = "top -> "
        
        guard !linkedList.isEmpty() else {
            stringRepresentation += "nil"
            
            return stringRepresentation
        }
        
        linkedList.forEach { item in
            stringRepresentation += "|\(item)"
        }
        
        stringRepresentation += "|"
        
        return stringRepresentation
    }
}
