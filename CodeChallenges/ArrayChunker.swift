import Foundation

class ArrayChunker {
    // MARK: - Public Methods
    
    func chunk(array: [Int], chunkSize: Int) -> [[Int]] {
        var chunkedArray: [[Int]] = []
        
        generateArrayChunks(inputArray: array, chunkSize: chunkSize) { chunkArray in
            chunkedArray.append(chunkArray)
        }
        
        return chunkedArray
    }
    
    func chunkTake2(array: [Int], chunkSize: Int) -> [[Int]] {
        var chunkedArray: [[Int]] = []
        
        array.forEach { number in
            var lastElement = chunkedArray.last
            
            if lastElement == nil || lastElement?.count == chunkSize {
                chunkedArray.append([number])
            } else {
                lastElement!.append(number)
                chunkedArray[chunkedArray.count - 1] = lastElement!
            }
        }
        
        return chunkedArray
    }
    
    func chunkTake3(array: [Int], chunkSize: Int) -> [[Int]] {
        var chunkedArray: [[Int]] = []
        
        var index = 0
        
        while index < array.count {
            if (index + chunkSize > array.count - 1) {
                let slice = Array(array[index...])
                
                chunkedArray.append(slice)
            } else {
                let slice = Array(array[index..<(index + chunkSize)])
                
                chunkedArray.append(slice)
            }
            
            index += chunkSize
        }
        
        return chunkedArray
    }
    
    // MARK: - Private Methods
    
    private func generateArrayChunks(inputArray: [Int],
                                     chunkSize: Int,
                                     onChunkCreation: ([Int]) -> Void) {
        var chunkSizeCounter = 0
        
        var currentChunk: [Int] = []
        
        inputArray.forEach { number in
            currentChunk.append(number)
            
            chunkSizeCounter += 1
            
            if chunkSizeCounter > chunkSize - 1 {
                onChunkCreation(currentChunk)
                
                currentChunk = []
                
                chunkSizeCounter = 0
            }
        }
        
        if !currentChunk.isEmpty {
            onChunkCreation(currentChunk)
        }
    }
}
