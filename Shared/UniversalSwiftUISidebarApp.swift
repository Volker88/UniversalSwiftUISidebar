//
//  UniversalSideBarApp.swift
//  Shared
//
//  Created by Volker Schmitt on 01.07.20.
//

import SwiftUI

@main
struct UniversalSideBarApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                #if os(macOS)
                SideBar()
                HomeView()
                #elseif os(iOS)
                if UIDevice.current.userInterfaceIdiom == .pad {
                    SideBar()
                    HomeView()
                } else if UIDevice.current.userInterfaceIdiom == .phone {
                    ContentView()
                }
                #endif
            }
            .customNavigationLayoutStyle() // apply StackNavigationStyle on iPhone to avoid default sidebar in iPhone 11 Pro Max in portrait mode
        }
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
