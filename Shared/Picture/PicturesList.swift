//
//  PicturesList.swift
//  UniversalSideBar
//
//  Created by Volker Schmitt on 01.07.20.
//

import SwiftUI

struct PicturesList: View {
    
    @State var sideBarOpen: Bool = false
    
    let data = (1...10).map { "\($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var isPresented = false
    @State private var image = ""
    @State private var scrollPosition = 0
    

    var sideBarButton: some View {
        Button(action: {
            sideBarOpen.toggle()
        }) {
            Image(systemName: "sidebar.left")
        }
    }
    
    var button: some View {
        if isPresented == true {
            return AnyView(HStack {
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "trash").customHoverEffect()
                })
                Spacer(minLength: 50)
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Image(systemName: "trash").customHoverEffect()
                })
            })
        }
        else {
            return AnyView(Spacer())
        }
    }
    
    
    var content: some View {
        GeometryReader { geo in
            ScrollView {
                if isPresented {
                    PictureDetail(name: "\(image)", isPresented: $isPresented)
                        .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
                } else {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 5) {
                        ForEach(data, id: \.self) { image in
                            
                            #if os(iOS)
                            NavigationLink(destination:
                                            PictureDetail(name: "\(image)", isPresented: $isPresented)
                            ) {
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width / CGFloat(columns.count), height: geo.size.width / CGFloat(columns.count))
                            }.buttonStyle(PlainButtonStyle())
                            
                            #elseif os(macOS)
                            Button(action: {
                                self.image = "\(image)"
                                isPresented = true
                            }) {
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width / CGFloat(columns.count), height: geo.size.width / CGFloat(columns.count))
                            }.buttonStyle(PlainButtonStyle())
                            #endif
                        }
                    }
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
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
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
        if UIDevice.current.userInterfaceIdiom == .phone {
            content
                .navigationBarTitle("Pictures", displayMode: .automatic)
                .navigationBarItems(leading: sideBarButton)
        } else {
            content
                .navigationBarTitle("Pictures", displayMode: .automatic)
        }
        #elseif os(macOS)
        content
            .navigationTitle("Pictures")
            .customFrameMacOS()
            .toolbar { Spacer() }
        #endif
    }
    
    
}

struct PicturesList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PicturesList()
            PicturesList()
                .preferredColorScheme(.dark)
        }
    }
}
