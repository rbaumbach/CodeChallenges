import UIKit

class AscendingValueDetector<T: Comparable>: NSObject {
    // MARK: - Public Methods
    
    func findFirst(input: [T]) -> [Int] {
        var startIndex = -1
        
        var i = 0
        
        while i < input.count - 1 {
            if startIndex == -1 && input[i] < input[i + 1] {
                startIndex = i
            } else if startIndex != -1 && input[i] > input[i + 1] {
                return [startIndex, i]
            }
            
            i += 1
        }
        
        if startIndex != -1 && input[input.count - 2] < input[input.count - 1] {
            return [startIndex, input.count - 1]
        }
        
        return []
    }
    
    func findFirstTake2(input: [T]) -> [Int] {
        var startIndex = -1
        var endIndex = -1
        
        var i = 0
        
        while i < input.count - 1 {
            if startIndex == -1 && input[i] < input[i + 1] {
                startIndex = i
                endIndex = i + 1
            } else if input[i] < input[i + 1] {
                endIndex = i + 1
            } else if startIndex != -1 && input[i] > input[i + 1] {
                return [startIndex, endIndex]
            }
            
            i += 1
        }
        
        if startIndex != -1 {
            return [startIndex, endIndex]
        }
        
        return []
    }
    
    func find(input: [T]) -> [[String: Int]] {
        var allascensions: [[String: Int]] = []
        
        var startIndex = -1
        var endIndex = -1
        
        var i = 0
        
        while i < input.count - 1 {
            if startIndex == -1 && input[i] < input[i + 1] {
                startIndex = i
                endIndex = i + 1
            } else if input[i] < input[i + 1] {
                endIndex = i + 1
            } else if startIndex != -1 && input[i] > input[i + 1] {
                let ascensionDict = ["startIndex": startIndex,
                                     "endIndex": endIndex]
                allascensions.append(ascensionDict)
                
                startIndex = -1
                endIndex = -1
            }
            
            i += 1
        }
        
        if startIndex != -1 {
            let ascensionDict = ["startIndex": startIndex,
                                 "endIndex": endIndex]
            allascensions.append(ascensionDict)
        }
        
        return allascensions
    }
}
