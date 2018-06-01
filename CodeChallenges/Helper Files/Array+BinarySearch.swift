import Foundation

// You can see the TDD'd version of this file in the following repo:
// https://github.com/rbaumbach/AlgorithmsAndDataStructuresInSwift

extension Array where Element: Comparable {
    // MARK: - Public Methods
    
    func binarySearch(item: Element) -> Int {
        var start = 0
        var end = self.count

        while start < end {
            let mid = (start + end) / 2

            if item == self[mid] {
                return mid
            } else if item < self[mid] {
                end = mid
            } else {
                start = mid + 1
            }
        }

        return -1
    }
    
    func recursiveBinarySearch(item: Element) -> Int {
        return recursiveBinarySearch(item: item, start: 0, end: self.count)
    }
    
    // MARK: - Private Methods
    
    private func recursiveBinarySearch(item: Element, start: Int, end: Int) -> Int {
        if start >= end {
            return -1
        }
        
        let mid = (start + end) / 2
        
        if item == self[mid] {
            return mid
        } else if item < self[mid] {
            return recursiveBinarySearch(item: item, start: start, end: mid)
        } else {
            return recursiveBinarySearch(item: item, start: mid + 1, end: end)
        }
    }
}
