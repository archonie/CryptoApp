//
//  CoinDetailModel.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 19.12.2024.
//

import Foundation

struct CoinDetailModel: Codable {
    let id, symbol, name: String?
    let blockTimeInMinutes: Int?
    let hashingAlgorithm: String?
    let description: Description?
    let links: Links?
    
}

struct Links: Codable {
    let homepage: [String]?
    let subredditURL: String?
}

struct Description: Codable {
    let en: String?
}
