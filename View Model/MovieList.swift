//
//  scrollView.swift
//  movies
//
//  Created by Tako Menteshashvili on 08.02.22.
//

import SwiftUI

struct MovieList: View {
    var title: String
    var movies: [Movie]
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .bold()
                .padding([.leading], 20)
                .font(.largeTitle)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movies) { movie in
                        MovieView(movie: movie)
                    }
                }
            }.frame(alignment: .topLeading)
        }
    }
}



