//
//  CustomModifier.swift
//  UniversalSwiftUISidebar
//
//  Created by Volker Schmitt on 27.06.20.
//

import SwiftUI


struct NavigationBarItemModifier: ViewModifier {
    
    var completion: () -> Void
    
    func body(content: Content) -> some View {
        #if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(content
                    .navigationBarItems(leading:
                                            Button(action: {
                                                completion()
                                            }) {
                                                Image(systemName: "sidebar.left")
                                            }))
        } else {
            return AnyView(content)
        }
        #else
        return AnyView(content)
        #endif
    }
}

extension View {
    func navigationBarItemModifier(completion: @escaping () -> Void) -> some View {
        self.modifier(NavigationBarItemModifier(completion: completion))
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
    func customNavigationLayoutStyle() -> some View {
        self.modifier(NavigationLayoutStyle())
    }
}


struct CustomNavigationBarTitleModifier: ViewModifier {
    
    let title: String
    
    func body(content: Content) -> some View {
        #if os(iOS)
            return AnyView(content
                            .navigationBarTitle("\(title)", displayMode: .inline))
        #else
            return AnyView(content)
        #endif
    }
}

extension View {
    func customNavigationBarTitleModifier(_ title: String) -> some View {
        self.modifier(CustomNavigationBarTitleModifier(title: title ))
    }
}


struct HideNavigationBarBackButton: ViewModifier {
    
    func body(content: Content) -> some View {
        #if os(iOS)
        return AnyView(content.hideNavigationBarBackButton())
        #else
            return AnyView(content)
        #endif
    }
}

extension View {
    func hideNavigationBarBackButton() -> some View {
        self.modifier(HideNavigationBarBackButton())
    }
}
