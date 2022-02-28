//
//  Cast.swift
//  movies
//
//  Created by Tako Menteshashvili on 25.02.22.
//

import Foundation
import SwiftUI


struct Cast: Identifiable, Decodable {
    
    var id: Int
    var name: String
    var profile_path: String
    
    
    
    func getProfileImage() -> URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/" +  self.profile_path)!;
        
    }
    
}



struct CastResponse: Decodable {
    var cast: [Cast]
}




