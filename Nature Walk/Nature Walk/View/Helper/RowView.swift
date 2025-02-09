//
//  RowView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import SwiftUI

struct RowView: View {
    var natureWalk: NatureWalk
    
    var body: some View {
        HStack {
            Image(natureWalk.photo[0])
                .resizable()
                .frame(width: 70, height: 50)
                .cornerRadius(10)
            Text(natureWalk.name)
                .font(Font.custom("Exo2-Bold", size: 15))
            Spacer()
            
            
            VStack {
                Text("$\(String(format: "%.2f", natureWalk.price))")
                    .font(Font.custom("Exo2-Regular", size: 15))
                
                RatingStar(rating: natureWalk.rating)
                    .scaleEffect(0.5)
                    .frame(width: 75)
            }
            
        }
    }
}

#Preview {
    RowView(natureWalk: NatureWalkList().list[0])
}
