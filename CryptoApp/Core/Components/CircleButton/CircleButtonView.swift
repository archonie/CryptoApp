//
//  CircleButtonView.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 15.12.2024.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0
            )
            .padding()
    }
}

#Preview (traits: .sizeThatFitsLayout){
    Group {
        CircleButtonView(iconName: "info")
            .colorScheme(.light)
        CircleButtonView(iconName: "plus")
    }
}
