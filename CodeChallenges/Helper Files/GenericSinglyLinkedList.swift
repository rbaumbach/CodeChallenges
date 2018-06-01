import Foundation

// You can see the TDD'd version of this file in the following repo:
// https://github.com/rbaumbach/AlgorithmsAndDataStructuresInSwift

class GenericSinglyLinkedList<T: Equatable>: CustomStringConvertible {
    // MARK: - Private Properties
    
    private var head: GenericSingleNode<T>?
    
    // MARK: - <CustomStringConvertible>
    
    var description: String {
        return constructStringRepresentation()
    }
    
    // MARK: - Public Methods
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func peek() -> T? {
        return head?.item
    }
    
    func clear() {
        head = nil
    }
    
    func addToFront(item: T) {
        if let oldHead = head {
            head = GenericSingleNode<T>(item: item)
            head?.nextNode = oldHead
        } else {
            head = GenericSingleNode<T>(item: item)
        }
    }
    
    func removeFromFront() -> T? {
        guard let oldHead = head else {
            return nil
        }
        
        let oldHeadItem = oldHead.item
        
        head = oldHead.nextNode
        
        return oldHeadItem
    }
    
    func addToBack(item: T) {
        if head == nil {
            head = GenericSingleNode<T>(item: item)
            
            return
        }
        
        let tailNode = findTailNode()
        
        tailNode.nextNode = GenericSingleNode<T>(item: item)
    }
    
    func addToBackRecursively(item: T) {
        if let head = head {
            addToBackRecursively(item: item, currentNode: head)
        } else {
            head = GenericSingleNode<T>(item: item)
        }
    }
    
    func removeFromBack() -> T? {
        guard let head = head else {
            return nil
        }
        
        if head.nextNode == nil {
            return head.item
        }
        
        let newTailNode: GenericSingleNode<T> = findNodeImmediatelyBeforeTailNode()
        let oldTailNode: GenericSingleNode<T>? = newTailNode.nextNode
        
        newTailNode.nextNode = nil
        
        return oldTailNode?.item
    }
    
    func removeFromBackRecursively() -> T? {
        guard let head = head else {
            return nil
        }
        
        if head.nextNode == nil {
            return head.item
        }
        
        return removeFromBackRecursively(currentNode: head)
    }
    
    func toArray(isAscending: Bool = false) -> [T] {
        guard head != nil else {
            return []
        }
        
        var generatedArray: [T] = []
        
        forEach { item in
            generatedArray.append(item)
        }
        
        if isAscending {
            generatedArray.reverse()
        }
        
        return generatedArray
    }
    
    func forEach(_ body: (T) -> Void) {
        guard let head = head else {
            return
        }
        
        var currentNode: GenericSingleNode<T>? = head
        
        while currentNode != nil {
            body(currentNode!.item)
            
            currentNode = currentNode?.nextNode
        }
    }
    
    // MARK: - Private Methods
    
    private func findTailNode() -> GenericSingleNode<T> {
        var currentNode: GenericSingleNode<T>? = head
        
        while currentNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
        }
        
        return currentNode!
    }
    
    private func findNodeImmediatelyBeforeTailNode() -> GenericSingleNode<T> {
        var currentNode: GenericSingleNode<T>? = head
        
        while currentNode?.nextNode?.nextNode != nil {
            currentNode = currentNode?.nextNode
        }
        
        return currentNode!
    }
    
    private func constructStringRepresentation() -> String {
        var stringRepresentation = "head -> "
        
        guard head != nil else {
            stringRepresentation += "nil"
            
            return stringRepresentation
        }
        
        
        forEach { item in
            stringRepresentation += "|\(item)| -> "
        }
        
        stringRepresentation += "nil"
        
        return stringRepresentation
    }
    
    private func addToBackRecursively(item: T,  currentNode: GenericSingleNode<T>) {
        if currentNode.nextNode == nil {
            currentNode.nextNode = GenericSingleNode<T>(item: item)
            
            return
        }
        
        addToBackRecursively(item: item, currentNode: currentNode.nextNode!)
    }
    
    private func removeFromBackRecursively(currentNode: GenericSingleNode<T>) -> T {
        if currentNode.nextNode?.nextNode == nil {
            let tailItem = currentNode.nextNode!.item
            
            return tailItem
        }
        
        return removeFromBackRecursively(currentNode: currentNode.nextNode!)
    }
}
