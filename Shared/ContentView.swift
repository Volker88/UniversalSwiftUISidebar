//
//  ContentView.swift
//  Shared
//
//  Created by Volker Schmitt on 27.06.20.
//

import SwiftUI

struct ContentView: View {
    
    @State var sideBarOpen: Bool = false

    var body: some View {
        
        return GeometryReader { g in
                ZStack {
                    
                    HomeView()
                    
                    SideMenuView(width: 300,
                                 isOpen: self.sideBarOpen,
                                 menuClose: { self.sideBarOpen = false })
                        .animation(.easeInOut)
                }
                
            }
            .navigationBarTitle(Text("Home"), displayMode: .inline)
            .navigationBarItemModifier(completion: { self.sideBarOpen.toggle() })
            .gesture(
                DragGesture(minimumDistance: 50)
                    .onChanged { value in
                        let direction = SwipeDirectionAPI.getSwipeDirection(value: value)
                        if direction == .right {
                            self.sideBarOpen = true
                        }
                    })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


