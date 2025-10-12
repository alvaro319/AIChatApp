//
//  become.swift
//  AIChatApp
//
//  Created by Alvaro Ordonez on 10/11/25.
//
import SwiftUI

// When using @Observable macro, all properties of a class become @Published by default,
// so if we don't want to publish a property, we preface it with @ObservationIgnored
// Note! Downside to @Observable macro
// All properties become published vars when using @Observable therefore if a var that is bound to a view is updated,
// it is updated on a background thread, but recall a var
// that is bound to a view must be updated on the main thread.

@Observable
class AppState {

    // we can only set it to a value within the class
    private(set) var showTabBar: Bool {
        // any time a value is set for showTabBar, save it to UserDefaults
        didSet {
            // created an extension for UserDefaults to clean up code a bit
            UserDefaults.showTabBarView = showTabBar
            // UserDefaults.standard.set(showTabBar, forKey: "showTabbarView")
        }
    }

    // without UserDefaults extension
    /*
    // when we load up showTabBar, if we don't pass a value, then
    // get the value from UserDefaults
    init(showTabBar: Bool = UserDefaults.standard.bool(forKey: "showTabbarView")) {
        self.showTabBar = showTabBar
    }
     */

    init(showTabBar: Bool = UserDefaults.showTabBarView) {
        self.showTabBar = showTabBar
    }

    func updateShowTabBarState(showTabBarView: Bool) {

        self.showTabBar = showTabBarView
    }
}

extension UserDefaults {

    private struct Keys {
        static let showTabbarView = "showTabbarView"
    }

    static var showTabBarView: Bool {
        get {
            standard.bool(forKey: Keys.showTabbarView)
        }
        set {
            standard.set(newValue, forKey: Keys.showTabbarView)
        }
    }
}
