//
//  TabView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-07.
//

import SwiftUI

struct MainView: View {
    @Environment(User.self) var user
    @Environment(NatureWalkList.self) var natureWalkList
    
    @Environment(\.dismiss) private var dismiss
    
    //navigation
    @State private var toLogIn = false
    
    //alert
    @State private var logOutAlert = false
    
    private var isRememberUser = UserDefaults.standard.bool(forKey: "isRememberUser")
    
    private func logOut() {
        UserDefaults.standard.set(false, forKey: "isRememberUser")
        do {
            let encodedData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(encodedData, forKey: user.email)
        } catch {
            print(error.localizedDescription)
        }
        natureWalkList.resetList()
        if !isRememberUser {
            dismiss()
        } else {
            toLogIn = true
        }
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
                        logOutAlert = true
                    } label: {
                        Text("Log out")
                            .bold()
                            .font(.subheadline)
                    }
                    .alert(
                        "Logout",
                        isPresented: $logOutAlert) {
                            Button("No", role: .cancel) { }
                            Button("Yes", role: .destructive) {
                                logOut()
                            }
                        } message: {
                            Text("Are you sure you want to logout?")
                        }


                }
            }
            .tint(Color("bigTextColor"))
        }
        .navigationDestination(isPresented: $toLogIn, destination: {
            LogInView()
        })
        .navigationBarBackButtonHidden()
        .interactiveDismissDisabled()
    }
    
}

#Preview {
    MainView()
        .environment(NatureWalkList())
        .environment(User())
}
