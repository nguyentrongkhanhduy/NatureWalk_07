//
//  Nature_WalkApp.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import SwiftUI

@main
struct Nature_WalkApp: App {
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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if !isRememberUser {
                    LogInView()
                } else {
                    MainView()
                }

            }
            .environment(natureWalkList)
            .environment(user)
        }
    }
}
