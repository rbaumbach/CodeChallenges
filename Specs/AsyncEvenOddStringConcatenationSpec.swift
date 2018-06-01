import Quick
import Nimble

@testable import CodeChallenges

// Problem: Implement this method such that if the parameter integer is even, the parameter completionBlock is called with the results
//          of getRemoteFirstString(completionBlock:) contactinated with the results of getRemoteSecondString(completionBlock:).
//
//          If the integer is odd, the completion block is called with the results of getRemoteFirstStringSuccess only.
//
//          Note: for this exercise, getRemoteFirstString(completionBlock:) passes "Billy" to it's completionBlock
//                and getRemoteSecondString(completionBlock) passes "Goat" to it's completionBlock
//
//          ex: var evenBuildString = ""
//
//          buildString(0) { string in
//              evenBuildString = string
//          }
//          evenBuildString -> "Billy Goat"
//
// Testing Notes: The protocol Dispatcher and class DispacherForQueue are used to mock out async calls on the main queue.  This class
//                FakeDispatcherForQueue is used for mocking our real DispatcherForQueue

class FakeDispatcherForQueue: Dispatcher {
    var executionBlock: (() -> Void)?
    
    func dispatchOnMainQueue(execute: @escaping () -> Void) {
        executionBlock = execute
    }
}

class AsyncEvenOddStringConcatenationSpec: QuickSpec {
    override func spec() {
        var subject: AsyncEvenOddStringConcatenation!
        var fakeDispatcherForQueue: FakeDispatcherForQueue!
        
        beforeEach {
            fakeDispatcherForQueue = FakeDispatcherForQueue()
            
            subject = AsyncEvenOddStringConcatenation(dispatcher: fakeDispatcherForQueue)
        }
        
        describe("buildString(using:completionBlock:)") {
            var finalConcatenatedString: String!
            
            describe("when integer parameter is even") {
                beforeEach {
                    subject.buildString(using: 0) { string in
                        finalConcatenatedString = string
                    }
                }
                
                it("passes it's completionBlock the correct string") {
                    expect(finalConcatenatedString).to(equal("BillyGoat"))
                }
            }
            
            describe("when integer parameter is odd") {
                beforeEach {
                    subject.buildString(using: 1) { string in
                        finalConcatenatedString = string
                    }
                }
                
                it("passes it's completionBlock the correct string") {
                    expect(finalConcatenatedString).to(equal("Billy"))
                }
            }
        }
        
        // Follow up question:
        //      Instead of using a completionBlock, set the testLabel with the correct string.
        
        describe("buildStringForLabel(using:completionBlock:)") {
            describe("when integer parameter is even") {
                beforeEach {
                    subject.buildStringForLabel(using: 0)
                    
                    fakeDispatcherForQueue.executionBlock?()
                }

                it("passes it's completionBlock the correct string") {
                    expect(subject.testLabel.text).to(equal("BillyGoat"))
                }
            }
            
            describe("when integer parameter is odd") {
                beforeEach {
                    subject.buildStringForLabel(using: 1)
                    
                    fakeDispatcherForQueue.executionBlock?()
                }
                
                it("passes it's completionBlock the correct string") {
                    expect(subject.testLabel.text).to(equal("Billy"))
                }
            }
        }
    }
}
