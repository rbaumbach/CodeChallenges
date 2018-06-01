import Quick
import Nimble

@testable import CodeChallenges

// Problem: Given an array and chunk size, divice the array into many sub arrays where each subarray has at most
//          a length of chunk size
//          ex: chunk([1, 2, 3, 4], 2) -> [ [1, 2], [3, 4] ]
//          chunk([1, 2, 3, 4, 5], 2) -> [ [1, 2], [3, 4], [5] ]
//          chunk([1, 2, 3, 4, 5, 6, 7, 8], 3) -> [ [1, 2, 3], [4, 5, 6], [7, 8] ]
//          chunk([1, 2, 3, 4, 5], 4) -> [ [1, 2, 3, 4], [5] ]
//          chunk([1, 2, 3, 4, 5], 10) -> [ [1, 2, 3, 4, 5] ]

class ArrayChunkerSpec: QuickSpec {
    override func spec() {
        var subject: ArrayChunker!
        
        var inputArray: [Int]!
        var outputChunkedArray: [[Int]]!
        
        beforeEach {
            subject = ArrayChunker()
        }
        
        describe("#chunk(array:chunkSize:") {
            describe("when input array is empty") {
                beforeEach {
                    inputArray = []
                    
                    outputChunkedArray = subject.chunk(array: inputArray, chunkSize: 44)
                }
                
                it("returns an empty array") {
                    expect(outputChunkedArray).to(equal([]))
                }
            }
            
            describe("when array can be broken perfectly into the given chunk size") {
                beforeEach {
                    inputArray = [1, 2, 3, 4]
                    
                    outputChunkedArray = subject.chunk(array: inputArray, chunkSize: 2)
                }
                
                it("returns the correct chunked output array") {
                    expect(outputChunkedArray).to(equal([ [1, 2], [3, 4] ]))
                }
            }
            
            describe("when array cannot be broken perfectly into the given chunk size") {
                it("returns the correct chunked output array") {
                    let outputChunkedArray1 = subject.chunk(array: [1, 2, 3, 4, 5], chunkSize: 2)
                    let outputChunkedArray2 = subject.chunk(array: [1, 2, 3, 4, 5, 6, 7, 8], chunkSize: 3)
                    let outputChunkedArray3 = subject.chunk(array: [1, 2, 3, 4, 5], chunkSize: 4)
                    
                    expect(outputChunkedArray1).to(equal([ [1, 2], [3, 4], [5] ]))
                    expect(outputChunkedArray2).to(equal([ [1, 2, 3], [4, 5, 6], [7, 8] ]))
                    expect(outputChunkedArray3).to(equal([ [1, 2, 3, 4], [5] ]))
                }
            }
            
            describe("when the chunk size is larger than the array") {
                beforeEach {
                    inputArray = [1, 2, 3, 4, 5]
                    
                    outputChunkedArray = subject.chunk(array: inputArray, chunkSize: 10)
                }
                
                it("returns the correct chunked output array") {
                    expect(outputChunkedArray).to(equal([ [1, 2, 3, 4, 5] ]))
                }
            }
        }
        
        describe("#chunkTake2(array:chunkSize:") {
            describe("when input array is empty") {
                beforeEach {
                    inputArray = []
                    
                    outputChunkedArray = subject.chunkTake2(array: inputArray, chunkSize: 44)
                }
                
                it("returns an empty array") {
                    expect(outputChunkedArray).to(equal([]))
                }
            }
            
            describe("when array can be broken perfectly into the given chunk size") {
                beforeEach {
                    inputArray = [1, 2, 3, 4]
                    
                    outputChunkedArray = subject.chunkTake2(array: inputArray, chunkSize: 2)
                }
                
                it("returns the correct chunked output array") {
                    expect(outputChunkedArray).to(equal([ [1, 2], [3, 4] ]))
                }
            }
            
            describe("when array cannot be broken perfectly into the given chunk size") {
                it("returns the correct chunked output array") {
                    let outputChunkedArray1 = subject.chunkTake2(array: [1, 2, 3, 4, 5], chunkSize: 2)
                    let outputChunkedArray2 = subject.chunkTake2(array: [1, 2, 3, 4, 5, 6, 7, 8], chunkSize: 3)
                    let outputChunkedArray3 = subject.chunkTake2(array: [1, 2, 3, 4, 5], chunkSize: 4)
                    
                    expect(outputChunkedArray1).to(equal([ [1, 2], [3, 4], [5] ]))
                    expect(outputChunkedArray2).to(equal([ [1, 2, 3], [4, 5, 6], [7, 8] ]))
                    expect(outputChunkedArray3).to(equal([ [1, 2, 3, 4], [5] ]))
                }
            }
            
            describe("when the chunk size is larger than the array") {
                beforeEach {
                    inputArray = [1, 2, 3, 4, 5]
                    
                    outputChunkedArray = subject.chunkTake2(array: inputArray, chunkSize: 10)
                }
                
                it("returns the correct chunked output array") {
                    expect(outputChunkedArray).to(equal([ [1, 2, 3, 4, 5] ]))
                }
            }
        }
        
        describe("#chunkTake3(array:chunkSize:") {
            describe("when input array is empty") {
                beforeEach {
                    inputArray = []

                    outputChunkedArray = subject.chunkTake3(array: inputArray, chunkSize: 44)
                }

                it("returns an empty array") {
                    expect(outputChunkedArray).to(equal([]))
                }
            }

            describe("when array can be broken perfectly into the given chunk size") {
                beforeEach {
                    inputArray = [1, 2, 3, 4]

                    outputChunkedArray = subject.chunkTake3(array: inputArray, chunkSize: 2)
                }

                it("returns the correct chunked output array") {
                    expect(outputChunkedArray).to(equal([ [1, 2], [3, 4] ]))
                }
            }
            
            describe("when array cannot be broken perfectly into the given chunk size") {
                it("returns the correct chunked output array") {
                    let outputChunkedArray1 = subject.chunkTake3(array: [1, 2, 3, 4, 5], chunkSize: 2)
                    let outputChunkedArray2 = subject.chunkTake3(array: [1, 2, 3, 4, 5, 6, 7, 8], chunkSize: 3)
                    let outputChunkedArray3 = subject.chunkTake3(array: [1, 2, 3, 4, 5], chunkSize: 4)

                    expect(outputChunkedArray1).to(equal([ [1, 2], [3, 4], [5] ]))
                    expect(outputChunkedArray2).to(equal([ [1, 2, 3], [4, 5, 6], [7, 8] ]))
                    expect(outputChunkedArray3).to(equal([ [1, 2, 3, 4], [5] ]))
                }
            }
            
            describe("when the chunk size is larger than the array") {
                beforeEach {
                    inputArray = [1, 2, 3, 4, 5]

                    outputChunkedArray = subject.chunkTake2(array: inputArray, chunkSize: 10)
                }

                it("returns the correct chunked output array") {
                    expect(outputChunkedArray).to(equal([ [1, 2, 3, 4, 5] ]))
                }
            }
        }
    }
}
