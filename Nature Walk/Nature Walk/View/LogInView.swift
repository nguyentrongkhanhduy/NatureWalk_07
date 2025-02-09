//
//  LogInView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import SwiftUI

struct LogInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var remember: Bool = false
    
    var body: some View {
        VStack {
            Text("Nature Walk")
                .font(Font.custom("DancingScript-Bold", size: 50))
                .foregroundColor(Color("bigTextColor"))
                .padding(.top, 90)
                .padding(.bottom, 60)
            
            
            Text("Welcome back!")
                .font(Font.custom("DancingScript-Regular", size: 20))
                .foregroundColor(Color("bigTextColor"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            VStack {
                CustomizedTextField(value: $username, label: "Username", isSecure: false)
                    .padding(.bottom, 15)
                
                CustomizedTextField(
                    value: $password,
                    label: "Password",
                    isSecure: true
                )
            }
            .padding()
            .background(content: {
                Rectangle()
                    .fill(Color(white: 1, opacity: 0.4))
                    .cornerRadius(10)
            })
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("strokeColor"), lineWidth: 2)
            )
            .padding(.horizontal)
            
            RememberMeButton(rememberMe: $remember)
                .padding(.leading, 20)
                .padding(.top, 10)
            
            Button {
                
            } label: {
                Text("Login")
                    .padding()
                    .foregroundColor(.white)
                    .font(Font.custom("Exo2-Bold", size: 20))
                    .frame(maxWidth: .infinity)
                    .background(
                        Rectangle()
                            .fill(Color("bigTextColor"))
                            .cornerRadius(10)
                    )
                    .padding()
            }
            .padding(.top, 50)

            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(Color("backgroundColor"))
        )
    }
}

#Preview {
    LogInView()
}
