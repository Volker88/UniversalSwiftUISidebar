//
//  ContentView.swift
//  UniversalSideBar
//
//  Created by Volker Schmitt on 02.07.20.
//

import SwiftUI

struct ContentView: View {
    
    @State var sideBarOpen: Bool = false
    
    var sideBarButton: some View {
        Button(action: {
            sideBarOpen.toggle()
        }) {
            Image(systemName: "sidebar.left")
        }
    }
    
    var content: some View {
        ZStack {
            
            HomeView()
            
            SideMenuView(width: 300,
                         isOpen: self.sideBarOpen,
                         menuClose: { self.sideBarOpen = false })
                .animation(.easeInOut)
        }
        .gesture(
            DragGesture(minimumDistance: 50)
                .onChanged { value in
                    let direction = SwipeDirectionAPI.getSwipeDirection(value: value)
                    if direction == .right {
                        #if os(iOS)
                        if UIDevice.current.userInterfaceIdiom == .phone {
                            self.sideBarOpen = true
                        }
                        #endif
                    }
                })
    }
    
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .phone
        {
            content
                .navigationBarItems(leading: sideBarButton)
                .navigationViewStyle(StackNavigationViewStyle())
        } else {
            content
        }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
