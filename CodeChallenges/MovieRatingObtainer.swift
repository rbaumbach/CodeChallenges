import UIKit

class Movie: Equatable, Comparable, Hashable, CustomStringConvertible {
    // MARK: - Public Properties

    var id = 0
    var rating = 0
    var similiarMovies: [Movie] = []
    
    // MARK: - <CustomStringConvertible>
    
    var description: String {
        return "{id: \(id), rating: \(rating)}"
    }
    
    // MARK: - <Hashable>
    
    var hashValue: Int {
        return id.hashValue ^ rating.hashValue ^ similiarMovies.count
    }
    
    // MARK: - Init Method
    
    init(id: Int, rating: Int, similiarMovies: [Movie] = []) {
        self.id = id
        self.rating = rating
        self.similiarMovies = similiarMovies
    }
    
    // MARK: - <Equatable>
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id &&
               lhs.rating == rhs.rating
    }
    
    // MARK: - <Comparable>
    
    static func < (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.rating < rhs.rating
    }
}

class MovieRatingObtainer {
    // MARK: - Public Methods
    
    func obtainHighestSimiliarMovies(movie: Movie, numberOfHighestRatedMovies: Int) -> [Movie] {
        var movieSet: Set<Movie> = Set<Movie>()
        movieSet.insert(movie)
        
        obtainHighestSimiliarMovies(movie: movie, movieSet: &movieSet)
        
        var allMoviesArray = Array(movieSet)
        
        allMoviesArray.sort { lhs, rhs in
            return rhs < lhs
        }
        
        return Array(allMoviesArray[0..<numberOfHighestRatedMovies])
    }
    
    // MARK: - Private Methods
    
    func obtainHighestSimiliarMovies(movie: Movie, movieSet: inout Set<Movie>) {
        if movie.similiarMovies == [] {
            return
        }
        
        movie.similiarMovies.forEach { movie in
            movieSet.insert(movie)
            
            obtainHighestSimiliarMovies(movie: movie, movieSet: &movieSet)
        }
    }
}
