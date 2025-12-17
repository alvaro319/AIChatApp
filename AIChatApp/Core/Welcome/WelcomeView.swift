//
//  WelcomeView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/9/25.
//

import SwiftUI

struct WelcomeView: View {

    // an environment object is passed into this View from AppView
    // make sure to include .environment(AppState()) in the Preview below
    @Environment(AppState.self) private var appState

    // didn't make imageName private in case we want to pass in a custom
    // image from our Preview below
    @State var imageName: String = Constants.randomImageString

    var body: some View {

        // IMPORTANT! Only need one NavigationStack in a view hierarchy.
        // if the parent view has a NavigationStack, it's children does!
        // Unless a view is opened as a sheet, then and only then
        // does that view require it's own NavigationStack because the
        // sheet isn't considered a child and instead it has its own
        // independent environment for the parent-child hierarchy
        NavigationStack {
            
            VStack {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()

                titleSection
                    .padding(.top, 24)

                // cta - Call To Action Buttons
                ctaButtons
                    .padding(16)

                policyLinks
            }
        }
    }

    private var titleSection: some View {
        VStack(spacing: 8) {
            // using native fonts and native Colors
            // automatically supports dark mode thus
            // saving you time
            Text("AI Chat 🤙🏼")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("Youtube @ SwiftfulThinking")
                .font(.caption)
                .foregroundStyle(.secondary)
        }

    }

    private var ctaButtons: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }

            Text("Already have an account? Sign In")
                // .foregroundStyle(.primary)
                .underline()
                .font(.body)
                // once we added .background below, we
                // add padding to increase clickable
                // area
                .padding(8)
                // .background(Color.red)// use this to see clickable area (temp)
                .tappableBackground()// use this to use clickable area of text
                .onTapGesture {

                }
        }
    }

    private var policyLinks: some View {
        HStack {
            Link(destination: URL(string: Constants.privacyPolicyUrlStr)!) {
                Text("Terms of Service")
                    .font(.body)
            }
            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)
            Link(destination: URL(string: Constants.termsofServiceUrlStr)!) {
                Text("Privacy Policy")
                    .font(.body)
            }
        }
    }
}

#Preview {

    @Previewable @State var applicationState: AppState = AppState()

    // When the WelcomeView() is called from AppView,
    // it passes in an environment Object, namely an
    // AppState object. We mimic that here in the preview
    WelcomeView()
        .environment(applicationState)
}
