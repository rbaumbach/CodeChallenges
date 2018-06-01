import Foundation

class ReverseIntToString {
    // MARK: - Public Methods
    
    func reverse(int: Int) -> String {
        if int == 0 {
            return "0"
        }
        
        var inputInt = int
        
        var isNegative = false
        
        if inputInt < 0 {
            isNegative = true
            inputInt = inputInt * (-1)
        }
        
        let reversedIntString = String(String(inputInt).reversed())
        
        var sanitizedIntString = removeLeadingZeros(input: reversedIntString)
        
        if isNegative {
            sanitizedIntString = "-" + sanitizedIntString
        }
        
        return sanitizedIntString
    }
    
    // MARK: - Private Method
    
    private func removeLeadingZeros(input: String) -> String {
        var hasLeadingZeros = true
        
        var sanitizedOutput = ""
        
        for char in input {
            if (hasLeadingZeros) {
                if char != "0" {
                    hasLeadingZeros = false
                    sanitizedOutput = sanitizedOutput + "\(char)"
                }
            } else {
                sanitizedOutput = sanitizedOutput + "\(char)"
            }
        }
        
        return sanitizedOutput
    }
}
