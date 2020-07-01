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

// MARK: - Struct Definition
struct ButtonModifier: ViewModifier {
    
    // MARK: - Body
    func body(content: Content) -> some View {
        
        // MARK: - Return View
        return content
            .padding(5)
            .foregroundColor(Color.white)
            .background(Color.secondary)
            .opacity(0.7)
            .cornerRadius(10)
    }
}

// MARK: - Extension View
extension View {
    // MARK: - Define Function
    func buttonModifier() -> some View {
        self.modifier(ButtonModifier()) // Apply Custom Modifier
    }
}


enum OperatingSystem {
    case macOS
    case iOS
    case tvOS
    case watchOS
    
    #if os(macOS)
    static let current = macOS
    #elseif os(iOS)
    static let current = iOS
    #elseif os(tvOS)
    static let current = tvOS
    #elseif os(watchOS)
    static let current = watchOS
    #else
    #error("Unsupported platform")
    #endif
}

extension View {
    /**
     OS specific Modifier
     
     ```
     struct ContentView: View {
     var body: some View {
     Text("Unicorn")
     .font(.system(size: 10))
     .ifOS(.macOS, .tvOS) {
     $0.font(.system(size: 20))
     }
     }
     }
     ```
     - Parameters:
     - operatingSystems: .macOS / .iOS / .tvOS / . watchOS
     - modifier: modifier to apply
     
     - Returns: View
     */
    @ViewBuilder
    func ifOS<Content: View>(_ operatingSystems: OperatingSystem..., modifier: @escaping (Self) -> Content) -> some View {
        if operatingSystems.contains(OperatingSystem.current) {
            modifier(self)
        } else {
            self
        }
    }
}
