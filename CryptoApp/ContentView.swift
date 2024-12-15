//
//  ContentView.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 15.12.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack (spacing: 40) {
                Text("Hello, world!")
                    .foregroundColor(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .foregroundColor(Color.theme.secondaryText)
                
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
            }.font(.headline)
        }
    }
}

#Preview {
    ContentView()
}
