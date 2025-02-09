//
//  User.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import Foundation
import Observation

@Observable
class User {
    var username: String = ""
    var password: String = ""
    var favourites: [NatureWalk] = []
}
