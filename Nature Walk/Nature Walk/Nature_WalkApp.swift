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
