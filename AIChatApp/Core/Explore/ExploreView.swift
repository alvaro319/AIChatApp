//
//  ExploreView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/8/25.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Explore")
                NavigationLink("Click Me") {
                    // Navigates to Another View
                    Text("Another View")
                        // if we want to hide the tabbar
                        // .toolbar(.hidden, for: .tabBar)
                }
            }
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    ExploreView()
}
