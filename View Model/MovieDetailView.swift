//
//  MovieDetailView.swift
//  movies
//
//  Created by Tako Menteshashvili on 08.02.22.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    @EnvironmentObject var castNetwork: CastNetwork
    
    var body: some View {
        
        ScrollView{
            VStack {
                AsyncImage(url: movie.getBackdropImage()) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray
                }
                
                
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .frame(width: 250, height: 280)
                
                
                HStack(spacing: 60){
                    
                    
                    Label(movie.release_date, systemImage: "text.insert")
                    
                    Spacer().frame(width: 35)
                    
                    Label((String(format: "%.1f", movie.vote_average)), systemImage: "star")
                    
                    
                }
            }.edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .leading) {
                
                Text(movie.original_title)
                    .bold()
                
            }
            Rectangle()
                .padding(.bottom, 0.2)
                .background(Color.black)
            
            Text(movie.overview)
                .font(.caption)
                .padding()
            
            
            Spacer()
            
            
            ScrollView(.horizontal){
                HStack {
                    ForEach(castNetwork.casts){ castItem in
                        VStack {
                            AsyncImage(url: castItem.getProfileImage()) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                Color.gray
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .frame(width: 180, height: 200)
                            
                            VStack{
                                Text(castItem.name)
                            }
                        }
                    }
                }.padding()
                
            }.onAppear {
                castNetwork.getCasts(movieId: movie.id)
            }
        }
    }
    
    
}
