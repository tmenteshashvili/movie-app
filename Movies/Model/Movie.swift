
import Foundation
import SwiftUI

struct Movie: Identifiable,Decodable {
    var id: Int
    var original_title: String
    var release_date: String
    var vote_average: Float
    var poster_path: String
    var overview: String
    var backdrop_path: String
    
    
    
    
    
    func getPosterImage() -> URL {
        return URL(string: "https://image.tmdb.org/t/p/w500" + self.poster_path)!;
    }
    
    func getBackdropImage() -> URL {
        return URL(string: "https://image.tmdb.org/t/p/w500" + self.backdrop_path)!
    }
    
}


struct PopularMovies: Decodable {
    var results: [Movie]
}


