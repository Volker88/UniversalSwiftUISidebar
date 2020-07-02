//
//  CustomModifier.swift
//  UniversalSideBar
//
//  Created by Volker Schmitt on 01.07.20.
//

import SwiftUI


// MARK: - HoverEffect
struct HoverEffect: ViewModifier {
    func body(content: Content) -> some View {
        #if os(iOS)
        return content
            .hoverEffect()
        #elseif os(macOS)
        return content
        #endif
    }
}


extension View {
    ///
    /// Hover Effect
    ///
    /// Apply hovereffect on iOS and prevents error messages when building for macOS
    ///
    /// - Returns: HoverEffect
    ///
    func customHoverEffect() -> some View {
        self.modifier(HoverEffect()) // Apply Custom Modifier
    }
}


struct CustomFrameMacOS: ViewModifier {
    func body(content: Content) -> some View {
        #if os(iOS)
        return content
        #elseif os(macOS)
        return content
            .frame(minWidth: 1000, idealWidth: 1500, maxWidth: 2000, minHeight: 750, idealHeight: 1000, maxHeight: 1500, alignment: .center)
        #endif
    }
}


extension View {
    ///
    /// Default Window Size
    ///
    /// Applys a default window size on macOS
    ///
    /// - Returns: View
    ///
    func customFrameMacOS() -> some View {
        self.modifier(CustomFrameMacOS()) // Apply Custom Modifier
    }
}


struct NavigationLayoutStyle: ViewModifier {
    func body(content: Content) -> some View {
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

extension View {
    ///
    /// Custom Navigation Layout
    ///
    /// Apply StackNavigationViewStyle to avoid defaul sidebar in iPhon 11 Pro Max in landscape mode
    ///
    /// - Returns: View
    ///
    func customNavigationLayoutStyle() -> some View {
        self.modifier(NavigationLayoutStyle())
    }
}


struct HideNavigationBarBackButton: ViewModifier {
    
    func body(content: Content) -> some View {
        #if os(iOS)
        return content.navigationBarBackButtonHidden(true)
        #else
        return content
        #endif
    }
    
}

extension View {
    ///
    /// Hide navigationbar back button
    ///
    ///  Hides back button on iOS and prevents error messages on macOS
    ///
    /// - Returns: View
    ///
    func hideNavigationBarBackButton() -> some View {
        self.modifier(HideNavigationBarBackButton())
    }
}
