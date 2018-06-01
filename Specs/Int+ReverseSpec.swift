import Quick
import Nimble

@testable import CodeChallenges

// Problem: Reverse an integer, keep the sign and remove leading zeros after reversal
//          ex: -500 -> "-5"
//              1234 -> "4321"

class Int_ReverseSpec: QuickSpec {
    override func spec() {
        describe("#integerReverse()") {
            it("reverses an integer") {
                expect(12345.integerReverse()).to(equal(54321))
            }
            
            describe("when the number is a negative number") {
                it("reverses the integer and keeps the negative sign") {
                    expect((-12345).integerReverse()).to(equal(-54321))
                }
            }
            
            describe("when the number is a single digit") {
                it("returns the single digit") {
                    expect(7.integerReverse()).to(equal(7))
                }
            }

            describe("when the number is 0") {
                it("returns 0 correctly") {
                    expect(0.integerReverse()).to(equal(0))
                }
            }
            
            describe("when the number ends with zeros") {
                it("returns the reversed integer without the leading 0's") {
                    expect(500.integerReverse()).to(equal(5))
                }
            }
        }
        
        describe("#stringReverse()") {
            it("reverses an integer") {
                expect(12345.stringReverse()).to(equal(54321))
            }
            
            describe("when the number is a negative number") {
                it("reverses the integer and keeps the negative sign") {
                    expect((-12345).stringReverse()).to(equal(-54321))
                }
            }
            
            describe("when the number is a single digit") {
                it("returns the single digit") {
                    expect(7.stringReverse()).to(equal(7))
                }
            }
            
            describe("when the number is 0") {
                it("returns 0 correctly") {
                    expect(0.stringReverse()).to(equal(0))
                }
            }
            
            describe("when the number ends with zeros") {
                it("returns the reversed integer without the leading 0's") {
                    expect(500.stringReverse()).to(equal(5))
                }
            }
        }
    }
}
