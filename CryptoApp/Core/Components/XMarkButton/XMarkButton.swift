//
//  XMarkButton.swift
//  CryptoApp
//
//  Created by Doğan Ensar Papuçcuoğlu on 17.12.2024.
//

import SwiftUI

struct XMarkButton: View {

    let action: () -> Void
    var body: some View {
        Button (action: {
            action()
        }){
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundColor(Color.theme.accent)
        }
    }
}

#Preview {
    XMarkButton{
        print("Button Tapped")
    }
}
