//
//  ContentView.swift
//  Shared
//
//  Created by Volker Schmitt on 27.06.20.
//

import SwiftUI

struct ContentView: View {
    
    @State var menuOpen: Bool = false
    
    var body: some View {
        
        return GeometryReader { g in
            ZStack {
                Text("Hello World! Home")
                
                SideMenuView(width: 300,
                             isOpen: self.menuOpen,
                             menuClose: { self.menuOpen = false })
                    .animation(.easeInOut)
            }
            
        }
        .navigationBarTitle(Text("Home"), displayMode: .inline)
        .navigationBarItemModifier(completion: { self.menuOpen.toggle() })
        .gesture(
            DragGesture(minimumDistance: 50)
                .onChanged { value in
                    let direction = SwipeDirectionAPI.detectDirection(value: value)
                    if direction == .right {
                        self.menuOpen = true
                    }
                })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Struct Definition
struct NavigationBarItemModifier: ViewModifier {
    
    // MARK: - Define Constants / Variables
    var completion: () -> Void
    // MARK: - Body
    func body(content: Content) -> some View {
        
        // MARK: - Return View
        #if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(content
                    .navigationBarItems(leading:
                                            Button(action: {
                                                completion()
                                            }) {
                                                Image(systemName: "sidebar.left")
                                            })
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
    func navigationBarItemModifier(completion: @escaping () -> Void) -> some View {
        self.modifier(NavigationBarItemModifier(completion: completion)) // Apply Custom Modifier
    }
}

