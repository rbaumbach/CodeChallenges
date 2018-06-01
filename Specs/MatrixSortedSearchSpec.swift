import Quick
import Nimble

@testable import CodeChallenges

// Problem: Given a sorted matrix mat[n][m] and an element ‘x’. Find position of x in the matrix if it is present, else print -1.
//          Matrix is sorted in a way such that all elements in a row are sorted in increasing order and for row ‘i’,
//          where 1 <= i <= n-1, first element of row 'i' is greater than or equal to the last element of row 'i-1'.
//          The approach should have O(log n + log m) time complexity.
//          ex: Input : mat[][] = { {1, 5, 9},
//                                  {14, 20, 21},
//                                  {30, 34, 43} }
//          x = 14
//          Output : (1, 0)
//          Input : mat[][] = { {1, 5, 9, 11},
//                              {14, 20, 21, 26},
//                              {30, 34, 43, 50} }
//          x = 42
//          Output : (-1, -1)

class MatrixSortedSearchSpec: QuickSpec {
    override func spec() {
        var subject: MatrixSortedSearch!

        beforeEach {
            subject = MatrixSortedSearch()
        }
        
        describe("#search(matrix:number:)") {
            var matrix: [[Int]]!
            var output: (Int, Int)!
            
            beforeEach {
                matrix = [ [1, 5, 9],
                           [14, 20, 21],
                           [30, 34, 43] ]
            }
            
            describe("when number is present in matrix") {
                beforeEach {
                    output = subject.search(matrix: matrix, number: 14)
                    
                    print("")
                }
                
                it("returns the ") {
                    expect(output.0).to(equal(1))
                    expect(output.1).to(equal(0))
                }
            }
            
            describe("when number is NOT present in matrix") {
                beforeEach {
                    output = subject.search(matrix: matrix, number: 42)
                }
                
                it("returns -1 string") {
                    expect(output.0).to(equal(-1))
                    expect(output.1).to(equal(-1))
                }
            }
        }

        describe("#iterativeSearch(matrix:number:)") {
            var matrix: [[Int]]!
            var output: (Int, Int)!
            
            beforeEach {
                matrix = [ [1, 5, 9],
                           [14, 20, 21],
                           [30, 34, 43] ]
            }

            describe("when number is present in matrix") {
                beforeEach {
                    output = subject.iterativeSearch(matrix: matrix, number: 14)
                    
                    print("")
                }

                it("returns the ") {
                    expect(output.0).to(equal(1))
                    expect(output.1).to(equal(0))
                }
            }

            describe("when number is NOT present in matrix") {
                beforeEach {
                    output = subject.iterativeSearch(matrix: matrix, number: 42)
                }

                it("returns -1 string") {
                    expect(output.0).to(equal(-1))
                    expect(output.1).to(equal(-1))
                }
            }
        }
    }
}
