//
//  ContentView.swift
//  movies
//
//  Created by Tako Menteshashvili on 01.02.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network
    @State private var selection = 0
    var body: some View {
        
        NavigationView{
            ScrollView {
                MovieList(title: "Popular", movies: network.popularMovies)
                MovieList(title: "Top Rated", movies: network.topRatedMovies)
                MovieList(title: "Upcoming", movies: network.upcomingMovies)
            }.onAppear {
                network.getPopularMovies()
                network.getTopRatedMovies()
                network.getUpComingMovies()
            }
            .navigationBarTitle("Movie")
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}

