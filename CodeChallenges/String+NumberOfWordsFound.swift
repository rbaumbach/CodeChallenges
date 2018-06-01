import Foundation

extension String {
    // Mark: - Public Methods
    
    func numberOfWordsFound(word: String) -> Int {
        guard self != "" else {
            return 0
        }
        
        let wordDict = addWordsToDict()
        
        if let numberOfWords = wordDict[word.lowercased()] {
            return numberOfWords
        } else {
            return 0
        }
    }
    
    // MARK: - Private Methods
    
    private func addWordsToDict() -> [String: Int] {
        let splitSentence = self.components(separatedBy: " ")
        
        var wordDict: [String: Int] = [:]
        
        splitSentence.forEach { word in
            let lowercaseWord = word.lowercased()
            
            if let countOfWord = wordDict[lowercaseWord] {
                wordDict[lowercaseWord] = countOfWord + 1
            } else {
                wordDict[lowercaseWord] = 1
            }
        }
        
        return wordDict
    }
}
