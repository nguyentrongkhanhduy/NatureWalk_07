//
//  RatingStar.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-07.
//

import SwiftUI

struct RatingStar: View {
    var rating: Int
    
    var body: some View {
        HStack {
            ForEach(1...rating, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(.pink)
            }
        }
    }
}

#Preview {
    RatingStar(rating: 5)
}
