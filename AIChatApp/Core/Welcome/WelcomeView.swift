//
//  WelcomeView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/9/25.
//

import SwiftUI

struct WelcomeView: View {

     @Environment(AppState.self) private var appState

    // didn't make imageName private in case we want to pass in a custome
    // image from our Preview below
    @State var imageName: String = Constants.randomImageString

    var body: some View {
        NavigationStack {
            
            VStack {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()

                titleSection
                    .padding(.top, 24)

                ctaButtons
                    .padding(16)

                policyLinks
            }
        }
    }

    private var titleSection : some View {
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

    private var ctaButtons : some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingCompletedView()

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

    private var policyLinks : some View {
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

    WelcomeView()
        .environment(applicationState)
}
