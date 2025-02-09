//
//  User.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import Foundation
import Observation

@Observable
class User: Codable {
    var username: String {
        return String(email.prefix(while: { char in
            char != "@"
        }))
    }
    var email: String = "eddie@gmail.com"
    var password: String = "123123"
    var favourites: [NatureWalk] = []
}
