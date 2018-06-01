import Quick
import Nimble

@testable import CodeChallenges

// Problem: Reverse a string
//          ex: "junk" -> "knuj"

class String_ReverseSpec: QuickSpec {
    override func spec() {
        describe("#classicReverse()") {
            it("reverses a string") {
                expect("junk".classicReverse()).to(equal("knuj"))
            }
        }
        
        describe("#swiftyReverse()") {
            it("reverses a string") {
                expect("junk".classicReverse()).to(equal("knuj"))
            }
        }
        
        describe("#functionalReverse()") {
            it("reverses a string") {
                expect("junk".functionalReverse()).to(equal("knuj"))
            }
        }
        
        describe("#stackReverse()") {
            it("reverses a string") {
                expect("junk".stackReverse()).to(equal("knuj"))
            }
        }
    }
}
