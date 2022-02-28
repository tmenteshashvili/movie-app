

import SwiftUI


class CastNetwork: ObservableObject {
    @Published var casts: [Cast] = []
    
    func getCasts(movieId: Int) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/" + String(movieId) + "/credits?api_key=389fa5a3c02b056fd3a2456b5bc6867e&language=en-US&fbclid=IwAR08kNg-eMcorqY69kywkDmunKf5OWWFcLou3HfgOn1O6TMeTY7lsd-Nyjk")else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, respons, error in
            if let error = error {
                print("Request error", error)
                return
            }
            
            guard let response = respons as? HTTPURLResponse else {return}
            
            
            if response.statusCode == 200 {
                guard let data = data else {return}
                DispatchQueue.main.async {
                    do {
                        let decodedCasts = try JSONDecoder().decode(CastResponse.self, from: data)
                        self.casts = decodedCasts.cast
                    } catch let error {
                        
                        print("Error Decoding", error)
                    }
                }
                
            }
            
        }
        
        dataTask.resume()
    }}
