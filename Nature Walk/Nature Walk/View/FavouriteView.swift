//
//  FavouriteView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-07.
//

import SwiftUI

struct FavouriteView: View {
    @Environment(NatureWalkList.self) var natureWalkList
    @Environment(User.self) var user
    
    @State private var isEditing = false
    
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
        var sortedList = user.favourites
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
    
    private func getUserFavourites() {
        user.favourites = natureWalkList.list.filter({ item in
            item.isFavourite == true
        })
    }
    
    private func removeFavourite(thisNatureWalk: NatureWalk) {
        let natureWalkIndex = natureWalkList.list.firstIndex { item in
                item.id == thisNatureWalk.id
            }!
        
        natureWalkList
            .list[natureWalkIndex].isFavourite = false
        getUserFavourites()
    }
    
    private func removeAllFavourites() {
        for item in user.favourites {
            removeFavourite(thisNatureWalk: item)
        }
        getUserFavourites()
    }

    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading){
                    Text("\(user.username)'s")
                    Text("Nature Walk list!")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(Font.custom("DancingScript-Bold", size: 35))
                .foregroundColor(Color("bigTextColor"))
                .padding()
                
                HStack {
                    Button(action: {
                        removeAllFavourites()
                    }, label: {
                        Text("Remove All")
                            .font(Font.custom("Exo2-Regular", size: 14))
                            .foregroundColor(Color("rowColor"))
                            .padding(5)
                            .background {
                                Rectangle()
                                    .fill(Color(white: 1, opacity: 0.4))
                                    .cornerRadius(10)
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("strokeColor"), lineWidth: 2)
                            }
                    })
                    .frame(width: isEditing ? nil : 0, height: isEditing ? nil : 0)
                    .opacity(isEditing ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3), value: isEditing)
                    
                    Button {
                        isEditing.toggle()
                    } label: {
                        Text(isEditing ? "Done" : "Edit")
                            .padding(.horizontal, 5)
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
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 8)
                
                VStack {
                    HStack {
                        Text("Check out your favourites!")
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
                        if user.favourites.count == 0 {
                            Text("Empty!")
                                .font(Font.custom("Exo2-Bold", size: 20))
                                .foregroundColor(Color(white: 0, opacity: 0.5))
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color(white: 1, opacity: 0))
                        } else {
                            ForEach(sortedList) { natureWalk in
                                if isEditing {
                                    RowView(
                                        natureWalk: natureWalk,
                                        isEditingFavourite: isEditing) { thisNatureWalk in
                                            removeFavourite(
                                                thisNatureWalk: thisNatureWalk
                                            )
                                        }
                                }
                                else {
                                    NavigationLink {
                                        DetailView(natureWalk: natureWalk)
                                    } label: {
                                        RowView(
                                            natureWalk: natureWalk) { natureWalk in
                                                
                                            }
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
            .onAppear(perform: {
                getUserFavourites()
            })
            .background(
                Color(Color("backgroundColor"))
            )
        }
    }
}

#Preview {
    FavouriteView()
        .environment(NatureWalkList())
        .environment(User())
}
