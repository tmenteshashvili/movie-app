
import SwiftUI

class Network: ObservableObject {
    @Published var popularMovies: [Movie] = []
    @Published var topRatedMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    
    func fetchMovies(url: String, onFinished: (@escaping ([Movie]) -> Void)) {
        guard let url = URL(string: url) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, respons, error in
            if let error = error {
                print("Request error", error)
                return
            }
            
            guard let response = respons as? HTTPURLResponse else { return }
            
            
            if response.statusCode == 200 {
                guard let data = data else {return}
                DispatchQueue.main.async {
                    do {
                        let decodedMovies = try JSONDecoder().decode(PopularMovies.self, from: data)
                        onFinished(decodedMovies.results)
                    } catch let error {
                        print("Error Decoding", error)
                    }
                }
                
            }
            
        }
        
        dataTask.resume()
    }
    
    
    func getTopRatedMovies(){
        self.fetchMovies(
            url: "https://api.themoviedb.org/3/movie/top_rated?api_key=389fa5a3c02b056fd3a2456b5bc6867e&language=en-US&fbclid=IwAR08kNg-eMcorqY69kywkDmunKf5OWWFcLou3HfgOn1O6TMeTY7lsd-Nyjk",
            onFinished: { movies in
                self.topRatedMovies = movies;
            }
        )
    }
    
    
    func getUpComingMovies(){
        self.fetchMovies(
            url: "https://api.themoviedb.org/3/movie/upcoming?api_key=389fa5a3c02b056fd3a2456b5bc6867e&language=en-US&fbclid=IwAR08kNg-eMcorqY69kywkDmunKf5OWWFcLou3HfgOn1O6TMeTY7lsd-Nyjk",
            onFinished: { movies in
                self.upcomingMovies = movies;
            }
        )
    }
    
    func getPopularMovies() {
        self.fetchMovies(
            url: "https://api.themoviedb.org/3/movie/popular?api_key=389fa5a3c02b056fd3a2456b5bc6867e&language=en-US&fbclid=IwAR08kNg-eMcorqY69kywkDmunKf5OWWFcLou3HfgOn1O6TMeTY7lsd-Nyjk",
            onFinished: { movies in
                self.popularMovies = movies;
            })
    }
    
    
}
