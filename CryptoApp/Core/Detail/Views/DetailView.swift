//
//  DetailView.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 19.12.2024.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            } else {
                
            }
        }
    }
}

struct DetailView: View {
    
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
    }
    
    var body: some View {
        ZStack {
            Text(coin.name)
        }
    }
}

#Preview {
    DetailView(coin: DeveloperPreview.instance.coin)
}
