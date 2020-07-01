//
//  NavigationBar.swift
//  Shared
//
//  Created by Volker Schmitt on 27.06.20.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        List{
            NavigationLink(destination: ContentView().hideNavigationBarBackButton()){
                Label("Home", systemImage: "house")
            }
            
            ForEach(1..<11) { i in
                NavigationLink(destination: DetailView(viewNumber: "\(i)")) {
                    Label("View \(i)", systemImage: "doc.plaintext")
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
