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
    
    private var isRememberUser = UserDefaults.standard.bool(forKey: "isRememberUser")
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if !isRememberUser {
                    LogInView()
                } else {
                    MainView(userName: "Eddie")
        //                .environment(user)
                }

            }
            .environment(NatureWalkList())
        }
    }
}
