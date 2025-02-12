//
//  ListNatureView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import SwiftUI

struct ListNatureView: View {
    @Environment(NatureWalkList.self) var natureWalkList
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
        sort(by: sortBy)
    }
    
    private func sort(by sortString: String) -> [NatureWalk] {
        var sortedList = natureWalkList.list
        switch sortString {
        case "priceIncrease":
            sortedList.sort { $0.price < $1.price }
        case "priceDecrease":
            sortedList.sort { $0.price > $1.price }
        case "ratingIncrease":
            sortedList.sort { $0.rating < $1.rating }
        case "ratingDecrease":
            sortedList.sort { $0.rating > $1.rating }
        default:
            break
        }
        return sortedList
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Nature Walk Sessions")
                        .font(Font.custom("DancingScript-Bold", size: 35))
                        .foregroundColor(Color("bigTextColor"))
                    Spacer()
                    Menu {
                        Picker("Sort By", selection: $sortBy) {
                            Text("Default").tag("none")
                            Text("Price Low-High").tag("priceIncrease")
                            Text("Price High-Low").tag("priceDecrease")
                            Text("Rating Low-High").tag("ratingIncrease")
                            Text("Rating High-Low").tag("ratingDecrease")
                        }
                    } label: {
                        Label(label, systemImage: "arrow.up.arrow.down")
                            .font(Font.custom("Exo2-Regular", size: 14))
                            .foregroundColor(Color("rowColor"))
                            .padding(5)
                            .background(
                                Rectangle()
                                    .fill(Color(white: 1, opacity: 0.4))
                                    .cornerRadius(10)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("strokeColor"), lineWidth: 2)
                            )
                    }
                    .padding(.trailing)
                }
                .padding(.horizontal)
                .padding(.top)
                
                List {
                    ForEach(sortedList) { session in
                        NavigationLink(destination: DetailView(natureWalk: session)) {
                            HStack(spacing: 10) {
                                Image(session.photo.first ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.vertical, 5)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(session.name)
                                        .font(Font.custom("DancingScript-Bold", size: 20))
                                        .foregroundColor(.primary)
                                    
                                    Text("$\(String(format: "%.2f", session.price))/person")
                                        .font(Font.custom("Exo2-Regular", size: 14))
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("rowColor"))
                                .padding(3)
                        )
                    }
                }
                .listStyle(PlainListStyle())
            }
            .background(
                Color("backgroundColor").ignoresSafeArea()
            )
        }
    }
}

#Preview {
    ListNatureView()
        .environment(NatureWalkList())
        .environment(User())
}
