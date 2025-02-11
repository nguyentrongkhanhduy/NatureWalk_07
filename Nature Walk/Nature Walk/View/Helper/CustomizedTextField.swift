//
//  CustomizedTextField.swift
//  Nature Walk
//
//  Created by Eddie Nguyen on 2025-02-08.
//

import SwiftUI

struct CustomizedTextField: View {
    @Binding var value: String
    var label: String
    var isSecure: Bool
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(label, text: $value)
                    .textInputAutocapitalization(.never)
            } else {
                TextField(label, text: $value)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
        }
        .font(Font.custom("Exo2-Bold", size: 20))
        .foregroundColor(.white)
        .tint(.white)
        .padding()
        .background(Color("rowColor"))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("strokeColor"), lineWidth: 2)
        )
    }
}

#Preview {
    @Previewable @State var textValue = ""
    
    CustomizedTextField(value: $textValue, label: "Username", isSecure: false)
}
