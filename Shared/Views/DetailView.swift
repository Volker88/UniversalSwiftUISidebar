//
//  DetailView.swift
//  UniversalSideBar
//
//  Created by Volker Schmitt on 01.07.20.
//

import SwiftUI

struct DetailView: View {
    
    @State var sideBarOpen: Bool = false
    
    var sideBarButton: some View {
        Button(action: {
            sideBarOpen.toggle()
        }) {
            Image(systemName: "sidebar.left")
        }
    }
    
    var content: some View {
        VStack{
            Text("Just another DetailView").padding()
            #if os(iOS)
            Spacer()
            #endif
        }
    }
    
    
    @ViewBuilder
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                #if os(iOS)
                if UIDevice.current.userInterfaceIdiom == .phone {
                    content
                        .frame(maxWidth: .infinity, minHeight: 1000, maxHeight: 1500)
                        .navigationBarTitle("DetailView", displayMode: .automatic)
                        .navigationBarItems(leading: sideBarButton)
                } else {
                    content
                        .frame(maxWidth: .infinity, minHeight: 1000, maxHeight: 1500)
                        .navigationBarTitle("DetailView", displayMode: .automatic)
                }
                #elseif os(macOS)
                content
                    .customFrameMacOS()
                    .toolbar { Spacer() }
                    .navigationTitle("DetailView")
                #endif
            }
            SideMenuView(width: 300,
                         isOpen: self.sideBarOpen,
                         menuClose: { self.sideBarOpen = false })
                .animation(.easeInOut)
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
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailView()
            DetailView()
                .preferredColorScheme(.dark)
        }
    }
}
