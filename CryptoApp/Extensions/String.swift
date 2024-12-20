//
//  String.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 21.12.2024.
//

extension String {
    
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
