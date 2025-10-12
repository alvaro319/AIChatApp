//
//  WelcomeView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/9/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            
            VStack {
                Text("Welcome")
                    .frame(maxHeight: .infinity)
                NavigationLink {
                    OnboardingCompletedView()
                } label: {
                    Text("Get Started")
                        .callToActionButton()
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    WelcomeView()
}
