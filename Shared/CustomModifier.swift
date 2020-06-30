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


struct ToolBarModifier: ViewModifier {
    
    var toggleMenu: () -> Void
    var leftButtonAction: () -> Void
    var rightButtonAction: () -> Void
    
    func body(content: Content) -> some View {
        #if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(content
                            .navigationBarItems(leading:
                                                    Button(action: {
                                                        toggleMenu()
                                                    }) {
                                                        Image(systemName: "sidebar.left")
                                                    }, trailing:
                                                        HStack {
                                                            Button(action: {
                                                                leftButtonAction()
                                                            }) {
                                                                Image(systemName: "backward")
                                                            }
                                                            Spacer(minLength: 10)
                                                            Button(action: {
                                                                rightButtonAction()
                                                            }) {
                                                                Image(systemName: "forward")
                                                            }
                                                        }))
        } else {
            return AnyView(content
                            .navigationBarItems(trailing:
                                                        HStack {
                                                            Button(action: {
                                                                leftButtonAction()
                                                            }) {
                                                                Image(systemName: "backward")
                                                            }
                                                            Spacer(minLength: 10)
                                                            Button(action: {
                                                                rightButtonAction()
                                                            }) {
                                                                Image(systemName: "forward")
                                                            }
                                                        }))
            
        }
        #else
        return AnyView(content
                        .toolbar {
                            ToolbarItem {
                                Button {
                                    leftButtonAction()
                                } label: {
                                    HStack {
                                        Image(systemName: "backward")
                                        Text("Back")
                                    }
                                    .padding(5)
                                    .foregroundColor(Color.white)
                                    .background(Color.secondary)
                                    .opacity(0.7)
                                    .cornerRadius(10)
                                }
                            }
                            ToolbarItem {
                                Button {
                                    leftButtonAction()
                                } label: {
                                    HStack {
                                        Image(systemName: "forward")
                                        Text("Next")
                                    }
                                    .padding(5)
                                    .foregroundColor(Color.white)
                                    .background(Color.secondary)
                                    .opacity(0.7)
                                    .cornerRadius(10)
                                }
                            }
                        }
        )
        #endif
    }
}

extension View {
    func toolBarModifier(toggleMenu: @escaping () -> Void, leftButtonAction: @escaping () -> Void, rightButtonAction: @escaping () -> Void) -> some View {
        self.modifier(ToolBarModifier(toggleMenu: toggleMenu, leftButtonAction: leftButtonAction, rightButtonAction: rightButtonAction))
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
