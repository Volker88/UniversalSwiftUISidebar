//
//  SideBar.swift
//  UniversalSideBar
//
//  Created by Volker Schmitt on 01.07.20.
//

import SwiftUI

struct SideBar: View {
    
    var list: some View {
        List {
            NavigationLink(
                destination: HomeView().hideNavigationBarBackButton(),
                label: {
                    Label("Home", systemImage: "house")
                })
            
            NavigationLink(
                destination: PicturesList().hideNavigationBarBackButton(),
                label: {
                    Label("Pictures", systemImage: "camera")
                })
            
            NavigationLink(
                destination: DetailView().hideNavigationBarBackButton(),
                label: {
                    Label("DetailView", systemImage: "heart")
                })
        }
        .listStyle(SidebarListStyle())
    }
    
    
    @ViewBuilder
    var body: some View {
        #if os(macOS)
        list
            .frame(minWidth: 200, idealWidth: 200, maxWidth: 250, maxHeight: .infinity, alignment: .center)
        #elseif os(iOS)
        list
            .overlay(SettingsOverlay(),alignment: .bottom)
            .edgesIgnoringSafeArea(.all)
        #endif
    }
}


struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SideBar()
            SideBar()
                .preferredColorScheme(.dark)
        }
    }
}
