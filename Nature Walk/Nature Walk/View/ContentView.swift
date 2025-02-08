//
//  TabView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-07.
//

import SwiftUI

struct ContentView: View {
    var userName: String
    
    var body: some View {
        TabView {
            ListNatureView(userName: userName)
                .tabItem {
                    Label("Nature Walks", systemImage: "leaf.fill")
                }
            
            
            FavouriteView()
                .tabItem {
                    Label("Favourites", systemImage: "heart.fill")
                }
        }
        .tint(.black)
    }
    
}

#Preview {
    ContentView(userName: "Eddie")
        .environment(NatureWalkList())
}
