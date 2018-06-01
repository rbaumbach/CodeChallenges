import Foundation

extension String {
    // MARK: - Public Methods
    
    func isPalidrome() -> Bool {
        let arrayOfCharacters = Array(self)

        var leftIndex = 0
        var rightIndex = arrayOfCharacters.count - 1

        while (leftIndex < rightIndex) {
            if arrayOfCharacters[leftIndex] != arrayOfCharacters[rightIndex] {
                return false
            }

            leftIndex = leftIndex + 1
            rightIndex = rightIndex - 1
        }

        return true
    }
    
    func isPalindromeSwifty() -> Bool {
        return self == String(Array<Character>(self).reversed())
    }
    
    func isPalindromeLettersOnly() -> Bool {
        let sanitizedString = removeCharacters(from: CharacterSet.letters.inverted)
        
        return sanitizedString.isPalidrome()
    }
    
    func isPalindromeIgnoreCase() -> Bool {
        let lowercaseString = self.lowercased()
        
        return lowercaseString.isPalidrome()
    }
    
    // MARK: - Private Methods
    
    private func removeCharacters(from forbiddenChars: CharacterSet) -> String {
        let sanitizedUnicodeScalarView = unicodeScalars.filter { unicodeScalar in
            !forbiddenChars.contains(unicodeScalar)
        }
        
        return String(String.UnicodeScalarView(sanitizedUnicodeScalarView))
    }
}
