//
//  TabView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-07.
//

import SwiftUI

struct MainView: View {
    var userName: String
    
    @State private var toLogin = false
    
    var body: some View {
        NavigationStack {
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
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        toLogin = true
                        UserDefaults.standard.set(false, forKey: "isRememberUser")
                    } label: {
                        Text("Log out")
                            .bold()
                            .font(.subheadline)
                    }
                }
            }
            .tint(Color("bigTextColor"))
            .navigationDestination(isPresented: $toLogin) {
                LogInView()
            }
            .navigationBarBackButtonHidden()
            .interactiveDismissDisabled()
        }
        
    }
    
}

#Preview {
    MainView(userName: "Eddie")
        .environment(NatureWalkList())
        .environment(User())
}
