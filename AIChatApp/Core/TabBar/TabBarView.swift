//
//  TabBarView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/8/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "eyes")
                }
            ChatsView()
                .tabItem {
                    Label("Chats", systemImage: "bubble.left.and.bubble.right.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

// Alternative Method (not a good one)
// If we use one single NavigationStack with a TabView inside,
// when we navigate to a destination link, we lose the entire
// tabItems at the bottom, for example, when we navigate to
// AnotherView, we lose the tab bar itmes on the bottom
// Additionally, with this approach we lose the display of the
// navigatonTitles because SwiftUI thinks the TabView is just
// one tabItem. If you notice when we click the tabItems,
// the navigationTitle stays displaying "Explore".
// To go around that problem, we would have to create our custom
// navigation Title.
// first we use .navigationBarHidden(true) to hide the
// .navigationTitle("Explore"), which doesn't change when hitting
// the different tabItems (not good). Instead we would need to create our
// own custom tab bar at the top of each tabItem
/*
struct TabBarView: View {
    var body: some View {
        NavigationStack {
            TabView {
                VStack {
                    //custom navBarTitle
                    Text("Explore")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Spacer()
                    Text("Explore")
                    NavigationLink("Click Me") {
                        // Navigates to Another View
                        Text("Another View")
                            // if we want to hide the tabbar
                            // .toolbar(.hidden, for: .tabBar)
                    }
                    Spacer()
                }
                .navigationTitle("Explore")
                .tabItem {
                    Label("Explore", systemImage: "eyes")
                }
                //chats View
                Text("Chats")
                    .navigationTitle("Chats")
                    .tabItem {
                        Label("Chats", systemImage: "bubble.left.and.bubble.right.fill")
                    }
                Text("Profile")
                    .navigationTitle("Profile")
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }
            .navigationBarHidden(true)
            .navigationTitle("Explore")
        }
    }
}
 */

#Preview {
    TabBarView()
}
