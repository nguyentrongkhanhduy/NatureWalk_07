//
//  Nature_WalkApp.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import SwiftUI

@main
struct Nature_WalkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(userName: "Eddie")
                .environment(NatureWalkList())
        }
    }
}
