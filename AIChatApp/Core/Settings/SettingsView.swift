//
//  SettingsView.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/12/25.
//

import SwiftUI

struct SettingsView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState

    var body: some View {
        NavigationStack {
            List {

                Button {
                    onSignOutPressed()
                } label: {
                    Text("Sign Out")
                }

            }
            .navigationTitle("Settings")
        }
    }

    private func onSignOutPressed() {
        // TBD - do some logic to sign user out of app
        dismiss()
        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateShowTabBarState(showTabBarView: false)
        }

    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
