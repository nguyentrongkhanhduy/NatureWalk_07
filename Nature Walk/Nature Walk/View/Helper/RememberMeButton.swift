//
//  RememberMeButton.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-08.
//

import SwiftUI

struct RememberMeButton: View {
    @Binding var rememberMe: Bool
    
    var body: some View {
        HStack {
            Button {
                rememberMe.toggle()
//                UserDefaults.standard.set(rememberMe, forKey: "isRememberUser")//for unexpected close
            } label: {
                Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundColor(Color("bigTextColor"))
            }
            
            Text("Remember me")
                            .font(Font.custom("DancingScript-Bold", size: 15))
                            .foregroundColor(Color("bigTextColor"))

                        Spacer()
        }
    }
}

#Preview {
    @Previewable @State var boolValue = false
    
    RememberMeButton(rememberMe: $boolValue)
}
