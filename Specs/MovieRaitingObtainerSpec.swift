import Quick
import Nimble

@testable import CodeChallenges

// Problem: Write a method that takes a "Movie" object and integer value n
//          The method should return an array of the highest ranking movies no larger than n.
//          Move object
//          class Movie {
//              rating: Int
//              similiar: [Movie]
//          ex: input movie (see below), n = 2
//          Movie(rating: 5, similiar: [Movie(rating: 6, similar:[Movie(rating: 7, similiar: []])])]
//              -> [Movie(rating: 7, similar: []]), Movie(raiting: 6, similar:[Movie(rating: 7, similiar: []])])]

class MovieRatingObtainerSpec: QuickSpec {
    override func spec() {
        var subject: MovieRatingObtainer!
        
        beforeEach {
            subject = MovieRatingObtainer()
        }
        
        describe("#obtainHighestSimilarMovies(movie:numberOfHighestRatedMovies:)") {
            var inputMovie: Movie!
            var highestSimilarMovies: [Movie]!
            
            describe("when the movies don't have circular references (movie has similar movies that reference itself)") {
                beforeEach {
                    inputMovie = Movie(id: 0, rating: 5, similiarMovies: [Movie(id: 1, rating: 6, similiarMovies: [Movie(id: 2, rating: 7)])])
                    
                    highestSimilarMovies = subject.obtainHighestSimiliarMovies(movie: inputMovie, numberOfHighestRatedMovies: 2)
                }
                
                it("returns the correct [Movie] array") {
                    let expectedHighestSimilarMoviesArray = [Movie(id: 2, rating: 7),
                                                             Movie(id: 1, rating: 6, similiarMovies: [Movie(id: 2, rating: 7)])]
                    
                    expect(highestSimilarMovies).to(equal(expectedHighestSimilarMoviesArray))
                }
            }
            
            describe("when the movies do have circular references") {
                var movie1: Movie!
                var movie2: Movie!
                
                beforeEach {
                    movie1 = Movie(id: 55, rating: 9)
                    movie2 = Movie(id: 66, rating: 2, similiarMovies: [movie1])
                    
                    inputMovie = Movie(id: 0, rating: 5, similiarMovies: [movie1, movie2])
                    
                    highestSimilarMovies = subject.obtainHighestSimiliarMovies(movie: inputMovie, numberOfHighestRatedMovies: 2)
                }
                
                it("returns the correct [Movie] array") {
                    let expectedHighestSimilarMoviesArray = [Movie(id: 55, rating: 9, similiarMovies: []),
                                                             Movie(id: 0, rating: 5, similiarMovies: [movie1, movie2])]
                    
                    expect(highestSimilarMovies).to(equal(expectedHighestSimilarMoviesArray))
                }
            }
        }
    }
}
