//
//  ProfileView.swift
//  movies
//
//  Created by Tako Menteshashvili on 18.02.22.
//

import SwiftUI

struct ProfileView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        
        NavigationView{
            
//            NavigationLink(destination: MovieView) {
        
        VStack(alignment: .center, spacing: 15) {
            
        Text("Welcome to Movie!")
         .font(.largeTitle).foregroundColor(Color.black)
          .padding([.top, .bottom], 40)
    
            
            TextField("Email", text: self.$email)
              .padding()
              .cornerRadius(20)
                          
            SecureField("Password", text: self.$password)
              .padding()
              .cornerRadius(20)
            
            Button(action: {}) {
              Text("Sign In")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.green)
                .cornerRadius(15.0)
            }
        }
    }
    }
        
        
    }

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


