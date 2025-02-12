//
//  MainView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-07.
//

import SwiftUI

struct MainView: View {
    @State private var toLogin = false
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "backgroundColor") ?? .white
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            TabView {
                ListNatureView()
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
                            .font(Font.custom("Exo2-Bold", size: 16))
                            .foregroundColor(Color("bigTextColor"))
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
    MainView()
        .environment(NatureWalkList())
        .environment(User())
}
