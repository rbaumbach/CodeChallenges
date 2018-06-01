import Quick
import Nimble

@testable import CodeChallenges

// Problem: Deterime if a string is a palidrome
//          ex: "tacocat" -> true
//          ex: "billy goat" - false

class String_PalindromeSpec: QuickSpec {
    override func spec() {
        var isPalidrome: Bool!
        
        describe("#isPalidrome()") {
            context("string is a palidrome") {
                beforeEach {
                    isPalidrome = "poop".isPalidrome()
                }
                
                it("returns true") {
                    expect(isPalidrome).to(beTruthy())
                }
            }
            
            context("string is NOT a palidrome") {
                beforeEach {
                    isPalidrome = "junk".isPalidrome()
                }
                
                it("returns false") {
                    expect(isPalidrome).to(beFalsy())
                }
            }
        }
        
        describe("#isPalindromeSwifty()") {
            context("string is a palidrome") {
                beforeEach {
                    isPalidrome = "poop".isPalindromeSwifty()
                }
                
                it("returns true") {
                    expect(isPalidrome).to(beTruthy())
                }
            }
            
            context("string is NOT a palidrome") {
                beforeEach {
                    isPalidrome = "junk".isPalindromeSwifty()
                }
                
                it("returns false") {
                    expect(isPalidrome).to(beFalsy())
                }
            }
        }
        
        // Here is a wrinkle, ignore all characters except a-z & A-Z (only letters)
        // ex: "!!! otto !" -> true
        //     ",.junk.com" -> false
        
        describe("#isPalindromeLettersOnly()") {
            context("string is a palidrome") {
                beforeEach {
                    isPalidrome = "!!! otto !".isPalindromeLettersOnly()
                }
                
                it("returns true") {
                    expect(isPalidrome).to(beTruthy())
                }
            }
            
            context("string is NOT a palidrome") {
                beforeEach {
                    isPalidrome = ",.junk.com".isPalindromeLettersOnly()
                }
                
                it("returns false") {
                    expect(isPalidrome).to(beFalsy())
                }
            }
        }
        
        // Here is another wrinkle, ignore case
        // ex: "Hannah" -> true
        //     "BuRRitO" -> false
        
        describe("#isPalindromeIgnoreCase()") {
            context("string is a palidrome") {
                beforeEach {
                    isPalidrome = "Hannah".isPalindromeIgnoreCase()
                }
                
                it("returns true") {
                    expect(isPalidrome).to(beTruthy())
                }
            }
            
            context("string is NOT a palidrome") {
                beforeEach {
                    isPalidrome = "BuRRitO".isPalindromeIgnoreCase()
                }
                
                it("returns false") {
                    expect(isPalidrome).to(beFalsy())
                }
            }
        }
    }
}
