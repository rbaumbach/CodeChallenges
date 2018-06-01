import Quick
import Nimble

@testable import CodeChallenges

// Problem: Given a string, return the character that is the most frequent in the string
//          ex: "hello" -> "l"
//              "1234555aaaaa" -> "a"

class String_MostFrequentCharSpec: QuickSpec {
    override func spec() {
        describe("#mostFrequentCharClassic()") {
            it("returns the character that appears the most in the string") {
                expect("1234555aaaaa".mostFrequentCharClassic()).to(equal("a"))
            }
            
            describe("when string is empty") {
                it("returns empty string") {
                    expect("".mostFrequentCharClassic()).to(equal(""))
                }
            }
        }
        
        describe("#mostFrequentCharSwifty()") {
            it("returns the character that appears the most in the string") {
                expect("1234555aaaaa".mostFrequentCharSwifty()).to(equal("a"))
            }
            
            describe("when string is empty") {
                it("returns empty string") {
                    expect("".mostFrequentCharSwifty()).to(equal(""))
                }
            }
        }
        
        // Extra wrinkle: If there are two characters that are tied for most characters, return the character
        // that is closer to the front of the string.
        // ex: "taco & burrito" -> "t", (t-2, a-2, o-2, r-2) are all tied, but "t" came first
        
        describe("#mostFrequentCharHardClassic()") {
            it("returns the character that appears the most in the string") {
                expect("1234555aaaaa".mostFrequentCharHardClassic()).to(equal("a"))
            }
            
            describe("when the string has multiple characters that are tied for highest frequency") {
                it("returns the character that appeared first (from beginning of the array)") {
                    expect("taco & burrito".mostFrequentCharHardClassic()).to(equal("t"))
                }
            }
            
            describe("when string is empty") {
                it("returns empty string") {
                    expect("".mostFrequentCharHardClassic()).to(equal(""))
                }
            }
        }
        
        describe("#mostFrequentCharHardSwifty()") {
            it("returns the character that appears the most in the string") {
                expect("1234555aaaaa".mostFrequentCharHardSwifty()).to(equal("a"))
            }
            
            describe("when the string has multiple characters that are tied for highest frequency") {
                it("returns the character that appeared first (from beginning of the array)") {
                    expect("taco & burrito".mostFrequentCharHardSwifty()).to(equal("t"))
                }
            }
            
            describe("when string is empty") {
                it("returns empty string") {
                    expect("".mostFrequentCharHardSwifty()).to(equal(""))
                }
            }
        }
    }
}
