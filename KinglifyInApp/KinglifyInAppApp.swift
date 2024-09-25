import SwiftUI
import KinglifyKit

@main
struct KinglifyInAppApp: App {
       
    @StateObject var kinglifyStoreKit = KinglifyStore(
        prodIds:["pookie.pro.monthly","pookie.pro.yearly"]

    );
    

    var body: some Scene {
        WindowGroup {
            KinglifyAppWrapper(
                content: ContentView(),
                handler: kinglifyStoreKit
            )
            .environmentObject(kinglifyStoreKit)
                       
                           
               
                
               
                
        }
    }
}
