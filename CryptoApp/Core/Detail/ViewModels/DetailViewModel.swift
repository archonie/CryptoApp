//
//  DetailViewModel.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 19.12.2024.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
        
    private let coinDetailService: CoinDetailDataService
    private var cancellables: Set<AnyCancellable> = []
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("RECEIVED COINDETAIL DATA")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
    
}
