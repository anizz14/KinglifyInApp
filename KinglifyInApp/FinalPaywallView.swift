//
//  FinalPaywall.swift
//  I Love My Wife
//
//  Created by Anish Shrestha on 10/07/2024.
//

import SwiftUI
import StoreKit
import KinglifyKit

struct FinalPaywall: View {
  
    @Binding var isSheetPresented: Bool
    @EnvironmentObject var storeViewModel: KinglifyStore
    var product: Product?

       
    var body: some View {
        ZStack{
           
            Color("PrimaryBackground").ignoresSafeArea(.all)
            
            VStack(spacing:6){
                Text("You have chosen")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                //chosen box part
               chosenSubscription(product: product)
                
                HStack(spacing: 20) {
                        VStack(alignment: .leading) {
                            Text("Total")
                                .font(.headline)
                            if product?.id == "pro.yearly" {
                                Text("for 12 Months")
                                    
                                    .foregroundColor(.blue)
                                Text("7 days free trial")
                                    .font(.subheadline)
                                    .italic()
    //                                .foregroundColor(.gray)
                            }
                            else {
                                Text("for 1 Month")
                                    .font(.subheadline)
                                    .foregroundColor(.blue)
                            }
                         
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            HStack(alignment: .firstTextBaseline, spacing: 10) {
//                                Text("$420.00")
//                                    .strikethrough()
//                                    .font(.headline)
//                                    .foregroundColor(.red)
                                VStack{
                                    Text(product?.displayPrice ?? "$0.00")
                                        .bold()
                                        .font(.title2)
                                    
                                    if product?.id == "pro.yearly" {
                                        Text("You save 53%")
                                            .font(.footnote)
                                            .foregroundColor(.green)
                                    }
                                    
                                }
                                
                            }

                        }
                    }
                .padding(.horizontal)
                Divider()
                VStack(spacing:0){
                    Text("Regular billing, free to cancel anytime.")
                        .font(.subheadline)
                        .padding(.vertical, 8)
                    if product?.id == "pro.yearly" {
                        Text("Your AppStore account will be charged upon confirmation of your purchase. The subscription includes a free trial period of 7 days. After the free trial ends, you will be billed $39.99 per year. The subscription will automatically renew unless auto-renew is disabled at least 24 hours before the end of the current billing cycle. You can manage your subscription and turn off auto-renewal in your Account Settings after the purchase. If applicable, any unused portion of a free trial period will be forfeited when you purchase a subscription. Unlock pro features including the advanced ovulation tracker with your subscription.”")
                            .multilineTextAlignment(.center)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.bottom, 4)
                    } else {
                        
                 
                    Text("Your AppStore account will be charged upon confirmation of your purchase. The subscription will automatically renew unless auto-renew is disabled at least 24 hours before the end of the current billing cycle. You can manage your subscription and turn off auto-renewal in your Account Settings after the purchase. If applicable, any unused portion of a free trial period will be forfeited when you purchase a subscription. Unlock pro features including the advanced ovulation tracker with your subscription.")
                        .multilineTextAlignment(.center)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.bottom, 4)
                    }
                    
                    paywallTerms()
                }
                Spacer()
            
            }
            .overlay(
                VStack {
                    Spacer()
                    PurchaseButton(isSheetPresented: $isSheetPresented, product: product)
                        .padding()
                        
                }
            )
            //Close Button on Top
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        isSheetPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.title2)
                            .opacity(0.5)
                    }
                }
                Spacer()
            }
            .padding()
           
           
        }
        .preferredColorScheme(.dark)
    }
    

}

//#Preview {
//    FinalPaywall(isSheetPresented: .constant(false))
//}

struct chosenSubscription: View {
    var product: Product?
    @EnvironmentObject var storeViewModel: KinglifyStore
    var body: some View{
        HStack{
            HStack{
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.blue)
                    .font(.title2)
                    
                VStack{
                    Text("\(product?.id == "pro.yearly" ? "12 Months" : "1 Month") Unlimited Pro")
                        .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .frame(width: 140)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                    
                }
                Spacer()
                VStack {
                    if let product = product {  // Safely unwrapping the `product`
                        if product.id == "pro.yearly" {
                            Text(storeViewModel.monthlyPriceText(product: product, numberOfMonths: Decimal(12)))
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        } else {
                            Text(storeViewModel.monthlyPriceText(product: product, numberOfMonths: Decimal(1)))
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                    } else {
                        Text("Product not available") // Handle the case where `product` is nil
                    }

                    Text("per month")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
            .padding()
         
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12)
//                .fill(Color("SecondaryBackground"))
        )
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}


struct paywallTerms: View {
    var body: some View {
            Text("By clicking \"Continue\" you agree to the [Privacy Policy](https://ilovemywife.app/privacy.html) & [Terms of Use (EULA)](https://www.apple.com/legal/internet-services/itunes/dev/stdeula/) of iLoveMyWife.")
            .multilineTextAlignment(.center)
            .font(.caption)
            .foregroundColor(.gray)
            .font(.system(size: UIFont.labelFontSize, weight: .semibold))
        .padding(4)
    }
}



