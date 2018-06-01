import Quick
import Nimble

@testable import CodeChallenges

// Problem: Reverse an integer and return as a string, keep the sign and remove leading zeros after reversal
//          ex: -500 -> "-5"
//              1234 -> "4321"

class ReverseIntToStringSpec: QuickSpec {
    override func spec() {
        var subject: ReverseIntToString!
        
        beforeEach {
            subject = ReverseIntToString()
        }
        
        describe("#reverse(int:)") {
            it("reverses an integer") {
                expect(subject.reverse(int: 54321)).to(equal("12345"))
            }
            
            describe("when the number is a negative number") {
                it("reverses the integer and keeps the negative sign") {
                    expect(subject.reverse(int: -12345)).to(equal("-54321"))
                }
            }
            
            describe("when the number is a single digit") {
                it("returns the single digit") {
                    expect(subject.reverse(int: 7)).to(equal("7"))
                }
            }
            
            describe("when the number is 0") {
                it("returns 0 correctly") {
                    expect(subject.reverse(int: 0)).to(equal("0"))
                }
            }
            
            describe("when the number ends with zeros") {
                it("returns the reversed integer without the leading 0's") {
                    expect(subject.reverse(int: 500)).to(equal("5"))
                }
            }
            
            describe("when the number ends with zeros and is negative") {
                it("returns the reversed integer without the leading 0's and is negative") {
                    expect(subject.reverse(int: -500000)).to(equal("-5"))
                }
            }
        }
    }
}
