import Quick
import Nimble

@testable import CodeChallenges

// Problem: Write a method that finds the first ascension of letters and returns the index of the start letter of the
//          ascension, and the end index of the ascension as a 2 element array
//          ex: ["b", "a", "b", "z", "r", "f", "c"] -> (1, 3)
//          The first "a" is the start of the first ascension, and ends at "z" because the letter after this
//          begins a descension.
//          Note: This would be easier with a tuple, but nimble has matcher issues with tuple.

class AscendingValueDetectorSpec: QuickSpec {
    override func spec() {
        var inputArray: [String]!
        
        var subject: AscendingValueDetector<String>!
        
        beforeEach {
            subject = AscendingValueDetector<String>()
        }
        
        describe("#findFirst(input:)") {
            var firstAsendingValueIndicies: [Int]!
            
            describe("when the input array is empty") {
                beforeEach {
                    inputArray = []
                    
                    firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                }
                
                it("returns an empty array") {
                    expect(firstAsendingValueIndicies).to(equal([]))
                }
            }
            
            describe("when input array does NOT have any ascending values") {
                beforeEach {
                    inputArray = ["b", "a"]
                    firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                }
                
                it("returns an empty array") {
                    expect(firstAsendingValueIndicies).to(equal([]))
                }
            }
            
            describe("when input array has ascending values") {
                describe("when the first ascension is in the middle of the array") {
                    beforeEach {
                        inputArray = ["b", "a", "b", "z", "r", "f", "c", "a", "b", "c"]
                        firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                    }
                    
                    it("returns the start and end index of the first ascending letters") {
                        expect(firstAsendingValueIndicies).to(equal([1, 3]))
                    }
                }
                
                describe("when the first ascension goes all the way to the end of the array") {
                    describe("when the last element is part of the ascension") {
                        beforeEach {
                            inputArray = ["b", "a", "b", "c", "d"]
                            firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                        }
                        
                        it("returns the start and end index of the first ascending letters") {
                            expect(firstAsendingValueIndicies).to(equal([1, 4]))
                        }
                    }
                }
            }
        }
        
        // Extra wrinkle: Handle duplicate values at the startIndex and endIndex of the ascending letters.  The start index should
        // be the last letter if there are duplicate letters, and the end index should be the first letter of the duplicate
        // letters.  Duplicate letters within the letter ascension should be ignored
        // ex: ["d", "c", "c", "c", "d", "e", "f", "f", "f", "g", "h", "h", "a"] -> [3, 10]
        
        describe("#findFirstTake2(input:)") {
            var firstAsendingValueIndicies: [Int]!

            describe("when the input array is empty") {
                beforeEach {
                    inputArray = []
                    
                    firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                }
                
                it("returns an empty array") {
                    expect(firstAsendingValueIndicies).to(equal([]))
                }
            }
            
            describe("when input array does NOT have any ascending values") {
                beforeEach {
                    inputArray = ["b", "a"]
                    firstAsendingValueIndicies = subject.findFirst(input: inputArray)
                }
                
                it("returns an empty array") {
                    expect(firstAsendingValueIndicies).to(equal([]))
                }
            }
            
            describe("when input array has ascending values") {
                describe("when the first ascension is in the middle of the array") {
                    beforeEach {
                        inputArray = ["d", "c", "c", "c", "d", "e", "f", "f", "f", "g", "h", "h", "a"]
                        firstAsendingValueIndicies = subject.findFirstTake2(input: inputArray)
                    }
                    
                    it("returns the start and end index of the first ascending letters") {
                        expect(firstAsendingValueIndicies).to(equal([3, 10]))
                    }
                }
                
                describe("when the first ascension goes all the way to the end of the array") {
                    beforeEach {
                        inputArray = ["d", "c", "c", "c", "d", "e", "f", "f", "f", "g", "h", "h", "i", "i"]
                        firstAsendingValueIndicies = subject.findFirstTake2(input: inputArray)
                    }
                    
                    it("returns the start and end index of the first ascending letters") {
                        expect(firstAsendingValueIndicies).to(equal([3, 12]))
                    }
                }
            }
        }
        
        // Extra wrinkle: Using the same wrinkle from findFirstTake2 (duplicates should be accounted for), write a method
        // that finds all sequences of ascending values and returns them as a dictionary that contains the start and end indicies
        // for each ascension.
        // ex: ["d", "c", "c", "c", "d", "e", "f", "f", "f", "g", "h", "h", "a", "b", "c"] ->
        //          [ ["startIndex": 3,
        //             "endIndex": 10],
        //            ["startIndex": 12,
        //             "endIndex": 14] ]
        
        describe("#find(input:)") {
            var allAscendingValueIndicies: [[String: Int]]!

            describe("when the input array is empty") {
                beforeEach {
                    inputArray = []
                    allAscendingValueIndicies = subject.find(input: inputArray)
                }

                it("returns an empty array") {
                    expect(allAscendingValueIndicies).to(equal([]))
                }
            }

            describe("when input array does NOT have any ascending values") {
                beforeEach {
                    inputArray = ["z", "y", "x", "w", "r", "a", "a"]
                    allAscendingValueIndicies = subject.find(input: inputArray)
                }

                it("returns an empty array") {
                    expect(allAscendingValueIndicies).to(equal([]))
                }

                describe("when input array has ascending values") {
                    beforeEach {
                        inputArray = ["d", "c", "c", "c", "d", "e", "f", "f", "f", "g", "h", "h", "a", "b", "c"]
                        allAscendingValueIndicies = subject.find(input: inputArray)
                    }

                    it("returns an array of dictionaries that contain the start/end indices of a letter ascension") {
                        let expectedArray = [ ["startIndex": 3,
                                               "endIndex": 10],
                                              ["startIndex": 12,
                                               "endIndex": 14] ]
                        expect(allAscendingValueIndicies).to(equal(expectedArray))
                    }
                }
            }
        }
    }
}
