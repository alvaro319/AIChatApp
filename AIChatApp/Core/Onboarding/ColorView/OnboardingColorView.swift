//
//  OnboardingColorView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/28/25.
//

import SwiftUI

struct OnboardingColorView: View {

//    let columns: [GridItem] = [
//        //The UI will try to fit as many Rectangles as possible into columns with a minimum of 50 and a maximum of 300
//        GridItem(.flexible(), spacing: 6, alignment: nil),
//        GridItem(.flexible(), spacing: 6, alignment: nil),
//        GridItem(.flexible(), spacing: 6, alignment: nil)
//    ]

    // commented out assigning to nil because SwiftLint was complaining
    // it wasn't necessary
    @State private var selectedColor: Color?// = nil
    let profileColors: [Color] = [.red, .green, .orange, .blue, .mint, .cyan, .teal, .indigo]
    // let profileColors: [Color] = [.red, .green, .orange, .blue, .mint, .cyan, .teal, .indigo, .purple, .black, .yellow, .brown, .gray, .accent, .pink]

    var body: some View {
        ScrollView {
            colorGrid
                // horizontal padding only to the circles and section title
                .padding(.horizontal, 24)
        }
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 16, content: {
            // places the Continue button on top of a safeAreaInset at the bottom
            // of the screen so that when the circles scroll down they scroll
            // behind the button and the safeAreaInset which sits behined the
            // Continue button. If you use the longer definition of profileColors[]
            // above and scroll downward on the view, you will see an
            // safeAreaInset with a Continue Button over it. We use
            ZStack {

                // this means if selectedColor isn't nil, show Continue button
                if let selectedColor {
                    // ctaButton // convert to a function
                    ctaButton(selectedColor: selectedColor)
                    // animates continue button
                    .transition(AnyTransition.move(edge: .bottom))
                }
           }
            .padding(24)
            // .background(Color(uiColor: .systemBackground))
            .background(.background) // simpler, check Dark Mode
        })
        .animation(.bouncy, value: selectedColor)
        .toolbar(.hidden, for: .navigationBar)// hides back button

    }

    private var colorGrid: some View {

        LazyVGrid(
            // columns: columns,
            // pass in an array of type GridItem
            columns:
                // array of columns that will be flexible in sizing, spaced
                // out by 16 and with 3 columns
                Array(
                    repeating: GridItem(.flexible(), spacing: 16),
                    count: 3
                ),
            alignment: .center,
            spacing: 16, // vertical spacing
            pinnedViews: [.sectionHeaders]) {
                // we can add sections
                Section(
                    header:
                        Text("Select a profile color")
                        .font(.headline)
                        // .frame(maxWidth: .infinity, alignment: .center)
                ) {
                    // Colors are not identifiable so must use id param,
                    // the hashable value we are going to loop on
                    ForEach(profileColors, id: \.self) {color in
                        Circle()
                            // first fill the circle with an accent color
                            .fill(.accent) // .foregroundStyle(color)
                            // then overlay the color but clip to the circular
                            // shape
                            .overlay(
                                color
                                    .clipShape(Circle())
                                    // adds  padding where you can
                                    // see the accent color behind
                                    // the overlay color.
                                    .padding(selectedColor == color ? 10 : 0)
                            )
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }
            }

    }

    // convert to a function because we need to pass in a variable
    /*
    private var ctaButton: some View {
        NavigationLink {
            OnboardingCompletedView()
        } label: {
            Text("Continue")
                .callToActionButton()
        }
    }
     */

    private func ctaButton(selectedColor: Color) -> some View {
        NavigationLink {
            OnboardingCompletedView(selectedColor: selectedColor)
        } label: {
            Text("Continue")
                .callToActionButton()
        }
    }
}

#Preview {
    // add this navigation stack so that Continue but can navigate to next screen
    // it is added only so preview can navigate
    NavigationStack {
        OnboardingColorView()
    }
    // required because OnboardingCompletedView expects an environment
    // variable so need to send in  an
    .environment(AppState())
}
