//
//  HapticManager.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 17.12.2024.
//

import Foundation
import SwiftUI

class HapticManager {
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
