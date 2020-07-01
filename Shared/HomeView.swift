//
//  HomeView.swift
//  UniversalSwiftUISidebar
//
//  Created by Volker Schmitt on 27.06.20.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var sideBarOpen: Bool
    
    let data = (1...10).map { "\($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State private var isPresented = false
    @State private var image = ""
    @State private var scrollPosition = 0
    
    
    // MARK: - Return Body
    var body: some View {
        
        #if os(macOS)
        return main
            .toolbar {
                Button(action: {
                    self.isPresented = false
                }) {
                    Label("Back", systemImage: "backward")
                        .buttonModifier()
                }
                Button(action: {
                    print("Empty")
                }) {
                    Label("Back", systemImage: "forward")
                        .buttonModifier()
                }
            }
        #elseif os(iOS)
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(main
                            .navigationBarTitle("Hello")
                            .navigationBarItems(leading:
                                                    Button(action: {
                                                        sideBarOpen.toggle()
                                                    }) {
                                                        Image(systemName: "sidebar.left")
                                                    }, trailing:
                                                        HStack {
                                                            Button(action: {
                                                                self.isPresented = false
                                                            }) {
                                                                Image(systemName: "backward")
                                                            }
                                                            Spacer(minLength: 10)
                                                            Button(action: {
                                                                print("Empty")
                                                            }) {
                                                                Image(systemName: "forward")
                                                            }
                                                        })
            )}
        else {
            return AnyView(main
                            .navigationBarTitle("Hello")
                            .navigationBarItems(trailing:
                                                    HStack {
                                                        Button(action: {
                                                            self.isPresented = false
                                                        }) {
                                                            Image(systemName: "backward")
                                                        }
                                                        Spacer(minLength: 10)
                                                        Button(action: {
                                                            print("Empty")
                                                        }) {
                                                            Image(systemName: "forward")
                                                        }
                                                    }))
        }
        #endif
    }
    
    
    // MARK: - Main
    var main: some View {
        
        return GeometryReader { geo in
            ScrollView {
                
                if isPresented {
                    PictureView(name: "\(image)")
                        .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
                } else {
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(data, id: \.self) { image in
                            #if os(iOS)
                            
                            NavigationLink(destination:
                                PictureView(name: "\(image)")
                            ) {
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width / CGFloat(columns.count), height: geo.size.width / CGFloat(columns.count))
                            }.buttonStyle(PlainButtonStyle())
                            #elseif os(macOS)
                            Button(action: {
                                self.image = "\(image)"
                                isPresented.toggle()
                            }) {
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width / CGFloat(columns.count), height: geo.size.width / CGFloat(columns.count))
                                    .id(image)
                                
                            }.buttonStyle(PlainButtonStyle())
                            #endif
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(sideBarOpen: .constant(false))
    }
}
