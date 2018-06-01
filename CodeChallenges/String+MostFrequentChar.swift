import Foundation

extension String {
    // MARK: - Public Methods
    
    func mostFrequentCharClassic() -> String {
        let characterDict = createDictionaryOfCharacterOccurrences(string: self)
        
        return mostFrequentChar(dict: characterDict)
    }
    
    func mostFrequentCharSwifty() -> String {
        let characterDict = createDictionaryOfCharacterOccurrences(string: self)
        
        let maxOccurrenceCharacter = characterDict.max { keyValue0, keyValue1 in
            return keyValue0.value < keyValue1.value
        }
        
        return maxOccurrenceCharacter?.key ?? ""
    }
    
    func mostFrequentCharHardClassic() -> String {
        var characterDict = createDictionaryOfCharacterOccurrencesWithIndex(string: self)
        
        var maxNumberOfOccurrences = characterDict.values.max { array0, array1 -> Bool in
            return array0[1] < array1[1]
        }
        
        var maxCharacterDict: [String: [Int]] = [:]
        
        for (char, numberOfOcurrences) in characterDict {
            if numberOfOcurrences[1] == maxNumberOfOccurrences![1] {
                maxCharacterDict[char] = maxNumberOfOccurrences
            }
        }
        
        var lowestCharacterIndex = Int.max
        var mostFrequentCharacter = ""

        for (char, numberOfOccurrences) in maxCharacterDict {
            if numberOfOccurrences[0] <= lowestCharacterIndex {
                lowestCharacterIndex = numberOfOccurrences[0]
                mostFrequentCharacter = char
            }
        }

        return mostFrequentCharacter
    }
    
    func mostFrequentCharHardSwifty() -> String {
        // can we update variable names?
        let characterDict = createDictionaryOfCharacterOccurrencesWithIndex(string: self)

        let maxNumberOfSingleLetterOccurrences = characterDict.values.max { array0, array1 in
            return array0[1] < array1[1]
        }?.last
        
        let maxCharacterDict = characterDict.filter { key, value in
            return value[1] == maxNumberOfSingleLetterOccurrences
        }
        
        let maxCharacter = maxCharacterDict.min { dictEntry0, dictEntry1 in
            return dictEntry0.value[0] < dictEntry1.value[0]
        }
        
        return maxCharacter?.key ?? ""
    }
    
    // MARK: - Private Methods
    
    private func createDictionaryOfCharacterOccurrences(string: String) -> [String: Int] {
        var characterDict: [String: Int] = [:]
        
        for char in self {
            if let charAccumulator = characterDict["\(char)"] {
                characterDict["\(char)"] = charAccumulator + 1
            } else {
                characterDict["\(char)"] = 1
            }
        }
        
        return characterDict
    }
    
    private func createDictionaryOfCharacterOccurrencesWithIndex(string: String) -> [String: [Int]] {
        var characterDict: [String: [Int]] = [:]
        
        var indexOfFirstOccurence = 0
        
        for char in string {
            if let charAccumulator = characterDict["\(char)"] {
                characterDict["\(char)"] = [charAccumulator[0], charAccumulator[1] + 1]
            } else {
                characterDict["\(char)"] = [indexOfFirstOccurence, 1]
            }
            
            indexOfFirstOccurence = indexOfFirstOccurence + 1
        }
        
        return characterDict
    }
    
    private func mostFrequentChar(dict: [String: Int]) -> String {
        var mostFrequentChar = ""
        var mostFrequentCharacterOccurence = 0
        
        for (key, value) in dict {
            if (value > mostFrequentCharacterOccurence) {
                mostFrequentChar = key
                mostFrequentCharacterOccurence = value
            }
        }
        
        return mostFrequentChar
    }
}
