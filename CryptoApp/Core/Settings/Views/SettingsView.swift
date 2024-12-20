//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 21.12.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://www.github.com/archonie")!
    
    var body: some View {
        NavigationView {
            List {
                aboutSection
                coingeckoSection
            }
            .accentColor(.blue)
            .font(.headline)
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton {
                        dismiss()
                    }
                }
            }
        }
        
    }
}

#Preview {
    NavigationView {
        SettingsView()
    }
}

extension SettingsView {
    private var aboutSection: some View {
        Section(header: Text("About")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made for learning purposes by Doğan Ensar Papuçcuoğlu. It uses MVVM architecture, Combine and CoreDate.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Check out my GitHub", destination: personalURL)
        }
    }
    
    private var coingeckoSection: some View {
        Section(header: Text("About CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API Coingecko.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Check out CoinGecko", destination: coingeckoURL)
        }
    }
}
