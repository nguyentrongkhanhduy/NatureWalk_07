//
//  ContentView.swift
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
        case "nameIncrease":
            return "Name A-Z"
        case "nameDecrease":
            return "Name Z-A"
        default:
            return "Default"
        }
    }
    
    var sortedList: [NatureWalk] {
        return sort(by: sortBy)
    }
    
    var userName: String
    
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
        case "nameIncrease":
            sortedList = sortedList.sorted(by: { a, b in
                a.name < b.name
            })
        case "nameDecrease":
            sortedList = sortedList.sorted(by: { a, b in
                a.name > b.name
            })
        default:
            break
        }
        return sortedList
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading){
                    Text("Hi, \(userName)")
                    Text("Welcome to Nature Walk!")
                }
                .font(Font.custom("DancingScript-Bold", size: 35))
                .bold()
                .padding(26)
                .background(content: {
                    Rectangle()
                        .fill(Color(white: 1, opacity: 0.4))
                        .cornerRadius(10)
                        .padding(3)
                })
                
                VStack {
                    HStack {
                        Text("Let's begin your adventure!")
                            .font(Font.custom("Exo2-Bold", size: 16))
                        Spacer()
                        Menu {
                            Picker(selection: $sortBy) {
                                Text("Default").tag("none")
                                Text("Price Low-High").tag("priceIncrease")
                                Text("Price High-Low").tag("priceDecrease")
                                Text("Name A-Z").tag("nameIncrease")
                                Text("Name Z-A").tag("nameDecrease")
                                
                            } label: {}
                        } label: {
                            Label(label, systemImage: "arrow.up.arrow.down")
                                .font(Font.custom("Exo2-Regular", size: 14))
                                .foregroundColor(Color("rowColor"))
                        }
                        
                            
                    }
                    .padding()
                    List {
                        ForEach(sortedList) { natureWalk in
                            NavigationLink {
                                DetailView(natureWalk: natureWalk)
                            } label: {
                                RowView(natureWalk: natureWalk)
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
                        .padding(3)
                })
                .padding(.horizontal, 8)
                
                
                .toolbar {
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            
                        } label: {
                            Text("Log out")
                                .bold()
                                .font(.subheadline)
                        }
                    }
                }
                
            }
            .background(
                Color(Color("backgroundColor"))
            )
        }
    }
}

#Preview {
    ListNatureView(userName: "Eddie")
        .environment(NatureWalkList())
}
