import Foundation

class FizzBuzz {
    func fizzbuzz(_ n: Int) -> [String] {
        var fizzbuzzArray: [String] = []
        
        for number in 1...n {
            if number % 3 == 0 && number % 5 == 0 {
                fizzbuzzArray.append("fizzbuzz")
            } else if number % 3 == 0 {
                fizzbuzzArray.append("fizz")
            } else if number % 5 == 0 {
                fizzbuzzArray.append("buzz")
            } else {
                fizzbuzzArray.append(String(number))
            }
        }
        
        return fizzbuzzArray
    }
}
