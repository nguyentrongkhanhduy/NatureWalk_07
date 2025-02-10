//
//  ContentView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import SwiftUI

struct ListNatureView: View {
    @Environment(NatureWalkList.self) var natureWalkList
    @Environment(User.self) var user
    
    @State private var sortBy = "none"
    var label: String {
        switch sortBy {
        case "priceIncrease":
            return "Price Low-High"
        case "priceDecrease":
            return "Price High-Low"
        case "ratingIncrease":
            return "Rating Low-High"
        case "ratingDecrease":
            return "Rating High-Low"
        default:
            return "Default"
        }
    }
    
    var sortedList: [NatureWalk] {
        return sort(by: sortBy)
    }
    
    private func sort(by sortString: String) -> [NatureWalk] {
        var sortedList = natureWalkList.list
        switch sortString {
        case "priceIncrease":
            sortedList = sortedList.sorted(by: { a, b in
                a.price < b.price
            })
        case "priceDecrease":
            sortedList = sortedList.sorted(by: { a, b in
                a.price > b.price
            })
        case "ratingIncrease":
            sortedList = sortedList.sorted(by: { a, b in
                a.rating < b.rating
            })
        case "ratingDecrease":
            sortedList = sortedList.sorted(by: { a, b in
                a.rating > b.rating
            })
        default:
            break
        }
        return sortedList
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("List view")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(
                Color(Color("backgroundColor"))
            )
        }
    }
}

#Preview {
    ListNatureView()
        .environment(NatureWalkList())
        .environment(User())
}
