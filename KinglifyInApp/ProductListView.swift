//
//  ProductListView.swift
//  pookieapp
//
//  Created by Anish Shrestha on 05/09/2024.
//

import SwiftUI
import StoreKit

struct ProductListView: View {
    var yearlyPro: Product?
    var monthlyPro: Product?
   
    @Binding var selectedSubscription: SubscriptionType
    var body: some View {
        HStack(spacing: 20) {
           
            if let product = monthlyPro {
                PaywallPriceOptions(product: product, selectedOption: selectedSubscription, subscriptionType: .yearly)
                    .onTapGesture {
                        selectedSubscription = .yearly
                    }
            } else {
                Text("Could not load product. Please check your internet connection!")
                    .font(.title3)
                    .foregroundStyle(Color("CustomBlue"))
                    .font(.system(size: UIFont.labelFontSize, weight: .bold))

                    .multilineTextAlignment(.center)
            }

            if let product = monthlyPro {
                PaywallPriceOptions(product: product, selectedOption: selectedSubscription, subscriptionType: .monthly)
                    .onTapGesture {
                        selectedSubscription = .monthly
                    }
            }
        }
        .padding(.vertical, 32)
     
    }
}

