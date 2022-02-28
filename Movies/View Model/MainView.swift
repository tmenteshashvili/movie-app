//
//  MainView.swift
//  movies
//
//  Created by Tako Menteshashvili on 11.02.22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView{
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Network())
    }
}
