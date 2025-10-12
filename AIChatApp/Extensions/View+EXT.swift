//
//  View+EXT.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/11/25.
//

import SwiftUI

extension View {
    
    func callToActionButton() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(.accent)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
