//
//  Nature_WalkApp.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import SwiftUI

@main
struct Nature_WalkApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @State private var user = User()
    @State private var natureWalkList = NatureWalkList()
    
    private var isRememberUser = UserDefaults.standard.bool(forKey: "isRememberUser")
    
    init() {
        if isRememberUser {
            do {
                if let recentUserEmail = UserDefaults.standard.string(forKey: "recentUser") {
                    if let existedUser = UserDefaults.standard.data(
                        forKey: recentUserEmail
                    ) {
                        let decodedUser = try JSONDecoder().decode(
                            User.self,
                            from: existedUser
                        )
                        natureWalkList.setFavourites(list: decodedUser.favourites)
                        user
                            .setUserEmailPassword(
                                email: decodedUser.email,
                                password: decodedUser.password
                            )
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func loadDataWhenLoadAppAgainIfInBackground() {
        do {
            if let recentUserEmail = UserDefaults.standard.string(forKey: "inactiveUser") {
                if let existedUser = UserDefaults.standard.data(
                    forKey: recentUserEmail
                ) {
                    let decodedUser = try JSONDecoder().decode(
                        User.self,
                        from: existedUser
                    )
                    natureWalkList.setFavourites(list: decodedUser.favourites)
                    user
                        .setUserEmailPassword(
                            email: decodedUser.email,
                            password: decodedUser.password
                        )
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func saveDataWhenCloseApp() {
        do {
            let encodedData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(encodedData, forKey: user.email)
            UserDefaults.standard.set(user.email, forKey: "inactiveUser")
        } catch {
            print(error.localizedDescription)
        }
        natureWalkList.resetList()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
//                if !isRememberUser {
//                    LogInView()
//                } else {
//                    MainView()
//                }
                LogInView()
            }
            .environment(natureWalkList)
            .environment(user)
            .onChange(of: scenePhase) { oldValue, newValue in
                if newValue == .inactive || newValue == .background {
                    saveDataWhenCloseApp()
                }
                
                if newValue == .active && oldValue == .inactive {
                    loadDataWhenLoadAppAgainIfInBackground()
                }
            }
        }
    }
}
