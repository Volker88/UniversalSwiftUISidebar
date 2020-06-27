//
//  UniversalSwiftUISidebarApp.swift
//  Shared
//
//  Created by Volker Schmitt on 27.06.20.
//

import SwiftUI

@main
struct UniversalSwiftUISidebarApp: App {
    
    func onAppear() {
        #if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            if UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown  {
                print("iPad Protrait")
            } else if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
                print("iPad Landscape")
            }

        } else if UIDevice.current.userInterfaceIdiom == .phone {
            
            
            if UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown  {
                print("iPhone Protrait")
            } else if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
                print("iPhone Landscape")
            }
        } else if UIDevice.current.userInterfaceIdiom == .mac {
                print("Mac")
        }
        #endif
    }
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                #if os(iOS)
                if UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .mac {
                    NavigationBar()
                }
                #endif
                ContentView()
            }
            .navigationLayoutStyle()
            .onAppear {
                onAppear()
            }
        }
    }
}


// MARK: - Struct Definition
struct NavigationLayoutStyle: ViewModifier {
    
    // MARK: - Body
    func body(content: Content) -> some View {
        
        // MARK: - Return View
        #if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(content
                .navigationViewStyle(StackNavigationViewStyle())
            )
        } else {
            return AnyView(content)
        }
        #else
            return AnyView(content)
        #endif
    }
}

// MARK: - Extension View
extension View {
    // MARK: - Define Function
    func navigationLayoutStyle() -> some View {
        self.modifier(NavigationLayoutStyle()) // Apply Custom Modifier
    }
}

