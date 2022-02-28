//
//  moviesApp.swift
//  movies
//
//  Created by Tako Menteshashvili on 01.02.22.
//

import SwiftUI

@main
struct MoviesApp: App {
    var network = Network()
    
    var body: some Scene {
        
        WindowGroup {
            MainView()
                .environmentObject(network)
        }
    }
}


struct MoviesApp_previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}

