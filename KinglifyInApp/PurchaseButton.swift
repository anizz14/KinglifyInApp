//
//  PurchaseButton.swift
//  pookieapp
//
//  Created by Anish Shrestha on 05/09/2024.
//

import SwiftUI
import StoreKit
import KinglifyKit

struct PurchaseButton: View {
    @Binding var isSheetPresented: Bool
    @EnvironmentObject var storeViewModel: KinglifyStore
    

    
  

       
    var product: Product?
    var body: some View {
        Button(action: {
            
            Task {
                if let product = product{
                    
                    
                    await buy(product: product)
                    isSheetPresented.toggle()
                }
                
//                if (product) {
//                    try {
//                        await buy(product); // Calls the async `buy` function with `product`
//                        isSheetPresented = !isSheetPresented; // Toggles the `isSheetPresented` boolean
//                    } catch (error) {
//                        console.error('Error buying product:', error);
//                    }
//                }
                
                

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
    }

    func buy(product: Product) async {
        do{
            if try await storeViewModel.purchase(product) != nil {
//                isPurchased = true
            }
        }
        catch {
            print("purchase failed")
}
    }
}

