//
//  RowView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import SwiftUI

struct RowView: View {
    @Environment(NatureWalkList.self) var natureWalkList
    var natureWalk: NatureWalk
    var natureWalkIndex: Int {
        natureWalkList.list.firstIndex { item in
            item.id == natureWalk.id
        }!
    }
    
    var isEditingFavourite = false
    
    let removeFromeFavourite: (NatureWalk) -> Void
    
    var body: some View {
        HStack {
            RoundedCornerImage(image: Image(natureWalk.photo[0]))
                .frame(width: 70, height: 50)
            Text(natureWalk.name)
                .font(Font.custom("Exo2-Bold", size: 15))
                .frame(width: 150, alignment: .leading)
            Spacer()
                       
            if isEditingFavourite {
                Button {
                    removeFromeFavourite(natureWalkList.list[natureWalkIndex])
                } label: {
                    Text("Remove")
                        .padding(5)
                        .font(Font.custom("Exo2-Bold", size: 12))
                        .foregroundColor(Color(white: 0, opacity: 0.5))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(white: 0, opacity: 0.5), lineWidth: 1)
                        }
                }
                .buttonStyle(BorderlessButtonStyle())
                
            } else {
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
}

#Preview {
    RowView(natureWalk: NatureWalkList().list[1]) {_ in}
        .environment(NatureWalkList())
}
