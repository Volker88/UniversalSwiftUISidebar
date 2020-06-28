//
//  UniversalSwiftUISidebarApp.swift
//  Shared
//
//  Created by Volker Schmitt on 27.06.20.
//

import SwiftUI

@main
struct UniversalSwiftUISidebarApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                #if os(iOS)
                if UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .mac {
                    NavigationBar()
                }
                #elseif os(macOS)
                NavigationBar()
                #endif
                ContentView()
                    
            }
            .customNavigationLayoutStyle()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}



