//
//  CompletedView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/11/25.
//

import SwiftUI

struct OnboardingCompletedView: View {

    @Environment(AppState.self) private var root

    var body: some View {
        VStack {
            Text("Onboarding Completed")
                .frame(maxHeight: .infinity)
            Button {
                // Finish onboarding and enter app!
                onFinishedButtonPressed()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }

        }
        .padding(16)
    }

    private func onFinishedButtonPressed() {
        // updates the showTabBar property for the environment object called
        // applicationState in AppView.swift
        root.updateShowTabBarState(showTabBarView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        // fixes Preview canvas error
        .environment(AppState())
}
