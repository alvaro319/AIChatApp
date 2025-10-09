//
//  AppView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/8/25.
//
import SwiftUI

// two different screens:
// Tabbar - after user is signed in
// onboarding flow - when user is signed out

struct AppView: View {

    // this will store the state of whether the user is logged in or not
    // defaults to false but if value is stored for it, it will use stored value
    // only usable in a view
    // we can also use this line of code at the top of every view
    // if we need it for some reason
    @AppStorage("showTabbarView") var showTabBar: Bool = false
    
    var body: some View {
        // two closures are passed into AppViewBuilder
        // the tabbar view and the onboarding view
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                TabBarView()
//                ZStack {
//                    Color.red.ignoresSafeArea()
//                    Text("Tabbar")
//                }
            },
            onboardingView: {
                WelcomeView()
//                ZStack {
//                    Color.blue.ignoresSafeArea()
//                    Text("Onboarding")
//                }
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

// two different screens:
// Tabbar - after user is signed in
// onboarding flow - when user is signed out
/*
struct AppView: View {

    @State private var showTabBar: Bool = false
    
    var body: some View {
        ZStack {
            if showTabBar {
                //tabbar view
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tabbar")
                }
                 // when displayed, it transitions in
                 // from the right or leading edge
                .transition(.move(edge: .trailing))
            } else {
                //onboarding view
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
                // when displayed, it transitions in
                // from the left or leading edge
                .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showTabBar)
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}
 */
 
// Let's say we want to always show the Tabbar view, here we show it by default,
// but as soon as the AppView appears, showOnboardingView is toggled to true
// and a fullScreenCover for Onboarding is shown.
/*
struct AppView: View {

    @State private var showOnboardingView: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                Color.red.ignoresSafeArea()
                Text("Tabbar")
            }
            // becomes visible from the right
            .transition(.move(edge: .trailing))
        }
        .onAppear {
            // check if user is signed in, if so,
            // show onboarding view.
            showOnboardingView.toggle()
        }
        .fullScreenCover(isPresented: $showOnboardingView, content: {
            ZStack {
                Color.blue.ignoresSafeArea()
                Text("Onboarding")
            }
        })
        .transaction { transaction in
            if showOnboardingView {
                transaction.disablesAnimations = true
            }
        }
    }
}
 */

#Preview("AppView - Tabbar") {
    AppView(showTabBar: true)
}
#Preview("AppView - Onboarding") {
    AppView(showTabBar: false)
}
