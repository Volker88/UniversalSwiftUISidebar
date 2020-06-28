//
//  HomeView.swift
//  UniversalSwiftUISidebar
//
//  Created by Volker Schmitt on 27.06.20.
//

import SwiftUI

struct HomeView: View {
    
    let data = (1...10).map { "\($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    @State private var isPresented = false
    @State private var image = ""
    
    var body: some View {
        
        return GeometryReader { geo in
            ScrollView {
                if isPresented {
                    ZStack {
                        PictureView(name: "\(image)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        //#if os(macOS)
                            Button(action: {
                                isPresented.toggle()
                            }) {
                                Text("Back")
                            }
                            .padding(5)
                            .background(Color.white)
                            .opacity(0.8)
                            .cornerRadius(10)
                            .position(x: 50, y: 20)
                        //#endif
                    }
                } else {
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(data, id: \.self) { image in
                            
                            Button(action: {
                                self.image = "\(image)"
                                isPresented.toggle()
                            }) {
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geo.size.width / CGFloat(columns.count), height: geo.size.width / CGFloat(columns.count))
                                
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .customNavigationBarTitleModifier("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
