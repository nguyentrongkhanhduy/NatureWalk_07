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
                VStack(alignment: .leading){
                    Text("Hi, \(user.username)")
                    Text("Welcome to Nature Walk!")
                }
                .font(Font.custom("DancingScript-Bold", size: 35))
                .foregroundColor(Color("bigTextColor"))
                .padding(.vertical, 20)
                
                VStack {
                    HStack {
                        Text("Let's begin your adventure!")
                            .font(Font.custom("Exo2-Bold", size: 16))
                            .foregroundColor(Color("bigTextColor"))
                        Spacer()
                        Menu {
                            Picker(selection: $sortBy) {
                                Text("Default").tag("none")
                                Text("Price Low-High").tag("priceIncrease")
                                Text("Price High-Low").tag("priceDecrease")
                                Text("Rating Low-High").tag("ratingIncrease")
                                Text("Rating High-Low").tag("ratingDecrease")
                                
                            } label: {}
                        } label: {
                            Label(label, systemImage: "arrow.up.arrow.down")
                                .font(Font.custom("Exo2-Regular", size: 14))
                                .foregroundColor(Color("rowColor"))
                                .padding(5)
                                .background(content: {
                                    Rectangle()
                                        .fill(Color(white: 1, opacity: 0.4))
                                        .cornerRadius(10)
                                })
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("strokeColor"), lineWidth: 2)
                                }
                        }
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    List {
                        ForEach(sortedList) { natureWalk in
                            NavigationLink {
                                DetailView(natureWalk: natureWalk)
                            } label: {
                                RowView(
                                    natureWalk: natureWalk
                                ) { natureWalk in
                                    
                                }
                            }
                            
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(
                            Rectangle()
                                .fill(Color("rowColor"))
                                .cornerRadius(10)
                                .padding(3)
                        )
                    }
                    .padding(8)
                    .animation(.default, value: sortedList)
                    .listStyle(.plain)
                }
                
                .background(content: {
                    Rectangle()
                        .fill(Color(white: 1, opacity: 0.4))
                        .cornerRadius(10)
                })
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("strokeColor"), lineWidth: 2)
                }
                .padding(.horizontal, 8)
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
