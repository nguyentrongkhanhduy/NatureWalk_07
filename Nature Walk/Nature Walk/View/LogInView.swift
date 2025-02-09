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
    @State private var isRemember: Bool = false
    
    @State private var toMainView = false
    
    @State private var showAlert = false
    
    @Environment(User.self) var user
    
    var body: some View {
        NavigationStack {
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
                    CustomizedTextField(value: $username, label: "Email", isSecure: false)
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
                
                RememberMeButton(rememberMe: $isRemember)
                    .padding(.leading, 20)
                    .padding(.top, 10)
                
                Button {
                    if username.isEmpty || password.isEmpty {
                        showAlert = true
                    } else {
                        user.email = username
                        user.password = password
                        toMainView = true
                        if isRemember {
                            UserDefaults.standard.set(true, forKey: "isRememberUser")
                        }
                    }
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
                .padding(.top, 25)
                .alert("Missing value", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("Please fill all fields.")
                }
                
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(Color("backgroundColor"))
            )
        }
        .navigationDestination(isPresented: $toMainView) {
            MainView(userName: "Eddie")
        }
        .navigationBarBackButtonHidden()
        .interactiveDismissDisabled()
    }
}

#Preview {
    
    LogInView()
        .environment(User())
}
