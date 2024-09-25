//
//  SubscribeButton.swift
//  pookieapp
//
//  Created by Anish Shrestha on 05/09/2024.
//

import SwiftUI
import StoreKit

struct SubscribeButton: View {
    @Binding var isSheetPresented: Bool
    var monthlyPro: Product?
    var yearlyPro: Product?
    var selectedSubscription: SubscriptionType
    
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        Button(action: {
            if monthlyPro != nil || yearlyPro != nil {
                isSheetPresented.toggle()
            } else {
                alertMessage = "Could not load product, please check your internet connection."
                showAlert = true
            }
        }) {
            Text("GO UNLIMITED")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .foregroundColor(.blue)
                .padding()
                .background(Color("CustomBlue"))
                .cornerRadius(10)
                .frame(minWidth: 120)
                .shadow(radius: 10)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}

