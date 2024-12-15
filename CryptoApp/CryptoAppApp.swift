//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 15.12.2024.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
