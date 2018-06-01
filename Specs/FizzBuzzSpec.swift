import Quick
import Nimble

@testable import CodeChallenges

// Problem: Write a method returns a [String] that contains numbers from 1 to n (as Strings).
//          For multiples of 3, insert "fizz" instead
//          For multiples of 5, insert "buzz" instead
//          For multiples of both 3 and 5, insert "fizzbuzz" instead
//          ex: fizzbuzz(15) -> ["1", "2", "fizz", "4", "buzz", ... , "14", "fizzbuzz"]

class FizzBuzzSpec: QuickSpec {
    override func spec() {
        var subject: FizzBuzz!
        
        beforeEach {
            subject = FizzBuzz()
        }
        
        describe("#fizzBuzz(_:)") {
            var fizzbuzzArray: [String]!
            
            beforeEach {
                fizzbuzzArray = subject.fizzbuzz(16)
            }
            
            it("returns the correct [String]") {
                let expectedFizzBuzzArray = [ "1", "2", "fizz", "4", "buzz", "fizz", "7", "8", "fizz",
                                              "buzz", "11", "fizz", "13", "14", "fizzbuzz", "16" ]
                
                expect(fizzbuzzArray).to(equal(expectedFizzBuzzArray))
            }
        }
    }
}
