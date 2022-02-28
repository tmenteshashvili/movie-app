//
//  MovieView.swift
//  movies
//
//  Created by Tako Menteshashvili on 02.02.22.
//
import SwiftUI

struct MovieView: View {
    var movie: Movie
    var body: some View {
        
        NavigationLink(destination: MovieDetailView(movie: movie).environmentObject(CastNetwork())) {
            VStack(alignment: .leading, content: {
                AsyncImage(url: movie.getPosterImage()) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(width: 130, height: 190)
                Text(movie.original_title)
                    .bold()
                    .frame(width: 130)
                    .font(.system(size: 15))
            })
                .padding()
                .frame(width: 130, height: 230, alignment: .leading)
        }
        
        
    }
}
