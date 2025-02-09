//
//  RoundedCornerImage.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-09.
//

import SwiftUI

struct RoundedCornerImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 2)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    RoundedCornerImage(image: Image("stonehenge1"))
}
