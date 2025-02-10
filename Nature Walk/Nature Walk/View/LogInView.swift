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
    @State private var showEmailAlert = false
    
    @Environment(User.self) var user
    
    private func isValidEmail(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Login view")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(Color("backgroundColor"))
            )
        }
        .navigationDestination(isPresented: $toMainView) {
            MainView()
        }
        .navigationBarBackButtonHidden()
        .interactiveDismissDisabled()
    }
}

#Preview {
    
    LogInView()
        .environment(User())
}
