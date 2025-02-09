//
//  DetailView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import SwiftUI

struct DetailView: View {
    @Environment(NatureWalkList.self) var natureWalkList
    var natureWalk: NatureWalk
    var natureWalkIndex: Int {
        natureWalkList.list.firstIndex { item in
            item.id == natureWalk.id
        }!
    }
       
    private func call() {
        if let url = URL(
            string: "sms://\(natureWalk.host.1.replacingOccurrences(of: " ", with: ""))"
        ), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            print("false")
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image(natureWalk.photo[1])
                    .resizable()
                    .frame(width: .infinity, height: 250)
                
                CircleImage(image: Image(natureWalk.photo[0]))
                    .offset(y: -130)
                    .padding(.bottom, -140)
                    .padding(.leading, -160)
                
                VStack(alignment: .leading) {
                    VStack {
                        
                        HStack(alignment: .firstTextBaseline) {
                            Text(natureWalk.name)
                                .font(Font.custom("DancingScript-Bold", size: 32))
                                .foregroundColor(.red)
                            Spacer()
                        }
                        
                        HStack {
                            Text(natureWalk.destination)
                                .foregroundStyle(.secondary)
                                .font(Font.custom("Exo2-Bold", size: 14))
                            Spacer()
                            
                            Button {
                                natureWalkList
                                    .list[natureWalkIndex].isFavourite
                                    .toggle()
                            } label: {
                                Label(
                                    "Toggle Favorite",
                                    systemImage: natureWalkList
                                        .list[natureWalkIndex].isFavourite ? "heart.fill" : "heart"
                                )
                                .labelStyle(.iconOnly)
                                .foregroundColor(natureWalkList
                                    .list[natureWalkIndex].isFavourite ? .pink : .gray)
                            }
                        }
                    }
                    .padding(16)
                    .background(content: {
                        Rectangle()
                            .fill(Color(white: 1, opacity: 0.4))
                            .cornerRadius(10)
                    })
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("strokeColor"), lineWidth: 2)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("About the trip")
                            .font(Font.custom("DancingScript-Bold", size: 25))
                            .foregroundColor(.red)
                        
                        Text(natureWalk.description)
                            .font(Font.custom("Exo2-Regular", size: 14))
                    }
                    .padding(16)
                    .background(content: {
                        Rectangle()
                            .fill(Color(white: 1, opacity: 0.4))
                            .cornerRadius(10)
                    })
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("strokeColor"), lineWidth: 2)
                    }
                    
                    VStack {
                        HStack {
                            Text("Rating:")
                                .font(Font.custom("Exo2-Bold", size: 16))
                            RatingStar(rating: natureWalk.rating)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                        
                        HStack {
                            Text("Price:")
                                .font(Font.custom("Exo2-Bold", size: 16))
                            Text("$\(String(format: "%.2f", natureWalk.price))/person")
                                .font(Font.custom("Exo2-Regular", size: 14))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(16)
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
                .padding()
            }
            .navigationTitle("Tour detail")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("backgroundColor"), for: .navigationBar)
            .toolbarBackground(Color("backgroundColor"), for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button {
                            natureWalkList
                                .list[natureWalkIndex].isFavourite
                                .toggle()
                        } label: {
                            Label(
                                natureWalkList
                                    .list[natureWalkIndex].isFavourite ? "Remove from Favourite" : "Add to Favorite",
                                systemImage: natureWalkList
                                    .list[natureWalkIndex].isFavourite ? "heart.fill" : "heart"
                            )
                        }
                        
                        ShareLink(item: "\(natureWalk.name), $\(String(format: "%.2f", natureWalk.price))") {
                            Label("Share", systemImage: "square.and.arrow.up")
                        }
                        
                        Button {
                            call()
                        } label: {
                            Label(
                                "Contact provider",
                                systemImage: "phone"
                            )
                        }
                        
                        
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundColor(.black)
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
    DetailView(natureWalk: NatureWalkList().list[0])
        .environment(NatureWalkList())
}
