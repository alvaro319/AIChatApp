//
//  OnboardingIntroView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/28/25.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
            VStack {
                // placed a Group around all the text to be able to add
                // modifiers to all of texts. Add a frame of maxHeight
                // to expand the texts as much as possilge
                Group {
                    // concatendated the texts to be able to add
                    // modifiers to parts of the sentence
                    Text("Make your own ")
                    +
                    Text("avatars ")
                        .foregroundStyle(.accent)
                        .fontWeight(.semibold)
                    +
                    Text("and chat with them!\n\n")
                    +
                    Text("Have")
                    +
                    Text(" real conversations ")
                        .foregroundStyle(.accent)
                        .fontWeight(.semibold)
                    +
                    Text("with AI generated responses.")
                }
                // the line spacing between each of the lines above
                .baselineOffset(6)
                // expands the frame placed around the texts above
                // as much as possible
                .frame(maxHeight: .infinity)
                .padding(24)// padding all around the texts above

                NavigationLink {
                    OnboardingColorView()
                } label: {
                    Text("Continue")
                        .callToActionButton()
                }

            }
            // places padding of 24 around the entire VStack
            .padding(24)
            .font(.title3)
            .toolbar(.hidden, for: .navigationBar) // hides back button
        }
}

#Preview {
    // add this navigation stack so that Continue but can navigate to next screen
    // it is added only so preview can navigate
    NavigationStack {
        OnboardingIntroView()
    }
}
