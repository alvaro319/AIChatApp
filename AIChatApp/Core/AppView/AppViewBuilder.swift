//
//  AppViewBuilder.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/8/25.
//
// AI Chat App: View Layers
// Routing between Signed In vs Signed Out
// see 3_architecture.jpg
// declarative programming means one view will be
// declared before the next view, so in order to get
// to the child views of tabbar view or onboarding view
// the parent child, AppView must compile
import SwiftUI

// this struct accepts two parameters that conform to a View
// the two parameters will be assigned the names tabbarView and
// onboardingView and the struct will return a View
struct AppViewBuilder<TabbarView: View, OnboardingView: View>: View {
    
    var showTabBar: Bool = false
    // these view builders get assigned the views passed in
    @ViewBuilder var tabbarView: TabbarView
    @ViewBuilder var onboardingView: OnboardingView
    
    var body: some View {
        ZStack {
            if showTabBar {
                tabbarView
                // becomes visible from the right
                .transition(.move(edge: .trailing))
            } else {
                onboardingView
                // becomes visible from the left
                .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}

// struct below primarily used for preview
private struct Preview: View {

    @State private var showTabBar: Bool = false
    
    var body: some View {
        // two closures are passed into AppViewBuilder
        // the tabbar view and the onboarding view
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tabbar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    Preview()
}
