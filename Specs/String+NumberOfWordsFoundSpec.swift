import Quick
import Nimble

@testable import CodeChallenges

// Problem: Write a method that returns the total amount of words for a given input word
//          ex: Input String: "Billy goat is a fiery, but kind goat that is also a black goat"
//          word to search for: "goat" -> 3

class String_NumberOfWordsFoundSpec: QuickSpec {
    override func spec() {
        describe("#numberOfWordsFound(word:)") {
            it("returns 0 when the string is empty") {
                expect("".numberOfWordsFound(word: "dude")).to(equal((0)))
            }
            
            it("returns 0 when word is not found in the original input string") {
                expect("Today is the day".numberOfWordsFound(word: "goat")).to(equal(0))
            }
            
            it("returns the total number of occurances of given input word from input string") {
                let inputString = "Billy goat is a fiery, but kind goat that is also a black goat"
                
                expect(inputString.numberOfWordsFound(word: "goat")).to(equal(3))
            }
            
            it("is case insensitive") {
                let inputString = "I Am USing GooFy CaSIng"
                
                expect(inputString.numberOfWordsFound(word: "goofy")).to(equal(1))
            }
        }
    }
}
