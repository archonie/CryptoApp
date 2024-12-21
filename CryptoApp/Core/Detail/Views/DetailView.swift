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

    @StateObject private var vm: DetailViewModel
    @State private var showFullDescription: Bool = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ChartView(coin: vm.coin)
                    .padding(.vertical)
                VStack(spacing: 20) {
                    overviewTitle
                    Divider()
                    descriptionSection
                    overviewGrid
                    additionalTitle
                    Divider()
                    additionalGrid
                    websiteSection
                }
                .padding()
            }
            
        }
        .background(Color.theme.background.ignoresSafeArea())
        .navigationTitle(vm.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItem
            }
        }
    }
}

#Preview {
    NavigationView {
        DetailView(coin: DeveloperPreview.instance.coin)
    }
}


extension DetailView {
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var additionalTitle: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var descriptionSection: some View {
        ZStack {
            if let coinDescription = vm.coinDescription, !coinDescription.isEmpty {
                VStack(alignment: .trailing) {
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                    Button(
                        action: {
                            withAnimation(.easeOut) {
                                showFullDescription.toggle()
                            }
                        }, label: {
                            Text(showFullDescription ? "Read Less..." : "Read More...")
                                .accentColor(Color.blue)
                                .font(.caption)
                                .fontWeight(.bold)
                                .padding(.vertical, 4)
                        }
                    )
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    private var websiteSection: some View {
        VStack(alignment: .trailing, spacing: 10) {
            if let websiteURL = vm.websiteURL, !websiteURL.isEmpty, let url = URL(string: websiteURL) {
                Link("Official Website", destination: url)
                    .font(.callout)
                    .fontWeight(.bold)
            }
            if let redditString = vm.redditURL, !redditString.isEmpty, let url = URL(string: redditString) {
                Link("/r/\(vm.coin.name)", destination: url)
                    
            }
        }
        .accentColor(Color.blue)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .font(.headline)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(columns: columns, alignment: .trailing, spacing: spacing, pinnedViews: []) {
            ForEach(vm.overviewStatistics) { stat in
                StatisticView(stat: stat)
            }
        }
    }
    
    private var additionalGrid: some View {
        LazyVGrid(columns: columns, alignment: .trailing, spacing: spacing, pinnedViews: []) {
            ForEach(vm.additionalStatistics) { stat in
                StatisticView(stat: stat)
            }
        }
    }
    
    private var navigationBarTrailingItem: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
}
