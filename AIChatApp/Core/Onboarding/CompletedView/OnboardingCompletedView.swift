//
//  CompletedView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/11/25.
//

import SwiftUI

struct OnboardingCompletedView: View {

    @Environment(AppState.self) private var root

    @State private var isCompletingProfileSetup: Bool = false

    var selectedColor: Color = .orange

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Setup complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)

            Text("We've set up your profile and you're ready to start chatting.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
            // moved to safeAreaInset below
            /*
            Button {
                // Finish onboarding and enter app!
                onFinishedButtonPressed()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
             */
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            ctaButton
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar) // hides back button
    }

    private var ctaButton: some View {
        Button {
            // Finish onboarding and enter app!
            onFinishedButtonPressed()
        } label: {
//            Text("Finish")
//                .callToActionButton()

            ZStack {
                if isCompletingProfileSetup {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Finish")

                }

            }
            .callToActionButton()
        }
        // disable button while bool is completing Setup
        .disabled(isCompletingProfileSetup)
    }

    /*
     When we click on the Finish button we want to save the selected color to the user's
     profile. There is a lot of logic that we need to do  in order to get to the user's profile.
     We haven't setup our database nor our user's profile....

     Going to assume that saving the selected Color to the user's profile is going to be
     asynchronous. It's going to hit the backend, save the data, and return a success.
     When successful, we will update the root state into the application.
     The method for saving the user profile is asynchronous.
     */
    private func onFinishedButtonPressed() {

        // started to save, shpw a progress view
        isCompletingProfileSetup = true

         Task {

             try await Task.sleep(for: .seconds(3))
            // try await saveUserProfile(color: selectedColor)

             // finished saving
             isCompletingProfileSetup = false

             // updates the showTabBar property for the environment object called
             // applicationState in AppView.swift
             root.updateShowTabBarState(showTabBarView: true)
         }

    }

}

#Preview {
    OnboardingCompletedView(selectedColor: .mint)
        // fixes Preview canvas error
        .environment(AppState())
}
