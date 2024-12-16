//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 16.12.2024.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
