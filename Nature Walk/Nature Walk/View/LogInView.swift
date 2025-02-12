//
//  LogInView.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-06.
//

import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isRemember: Bool = false
    
    @State private var toMainView: Bool = false
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    @Environment(User.self) var user
    
    let validUsers = [
        ("test@gmail.com", "test123"),
        ("admin@gmail.com", "admin123")
    ]
    
    private func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func loadSavedCredentials() {
        let remember = UserDefaults.standard.bool(forKey: "isRememberUser")
        if remember {
            if let savedEmail = UserDefaults.standard.string(forKey: "storedEmail"),
               let savedPassword = UserDefaults.standard.string(forKey: "storedPassword") {
                email = savedEmail
                password = savedPassword
                isRemember = true
            }
        }
    }
    
    private func saveCredentials() {
        UserDefaults.standard.set(isRemember, forKey: "isRememberUser")
        if isRemember {
            UserDefaults.standard.set(email, forKey: "storedEmail")
            UserDefaults.standard.set(password, forKey: "storedPassword")
        } else {
            UserDefaults.standard.removeObject(forKey: "storedEmail")
            UserDefaults.standard.removeObject(forKey: "storedPassword")
        }
    }
    
    private func performLogin() {
        guard isValidEmail(email) else {
            alertMessage = "Please enter a valid email address."
            showAlert = true
            return
        }
        
        guard !password.isEmpty else {
            alertMessage = "Password cannot be empty."
            showAlert = true
            return
        }
        
        if validUsers.contains(where: { $0.0.lowercased() == email.lowercased() && $0.1 == password }) {
            user.email = email
            user.password = password
            user.favourites = []
            saveCredentials()
            toMainView = true
        } else {
            alertMessage = "Invalid credentials. Please try again."
            showAlert = true
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome to Nature Walk")
                    .font(Font.custom("DancingScript-Bold", size: 35))
                    .foregroundColor(Color("bigTextColor"))
                    .padding(.top, 40)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .font(Font.custom("Exo2-Regular", size: 16))
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .font(Font.custom("Exo2-Regular", size: 16))
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                Toggle(isOn: $isRemember) {
                    Text("Remember Me")
                        .font(Font.custom("Exo2-Regular", size: 16))
                        .foregroundColor(Color("bigTextColor"))
                }
                .padding(.horizontal)
                
                Button(action: {
                    performLogin()
                }) {
                    Text("Login")
                        .font(Font.custom("Exo2-Bold", size: 18))
                        .foregroundColor(Color("bigTextColor"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color( "strokeColor"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
            .background(Color("backgroundColor").ignoresSafeArea())
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Error"),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("OK")))
            }
            .onAppear {
                loadSavedCredentials()
            }
            .navigationDestination(isPresented: $toMainView) {
                MainView()
            }
        }
        .navigationBarBackButtonHidden()
        .interactiveDismissDisabled()
    }
}

#Preview {
    LogInView()
        .environment(User())
}
