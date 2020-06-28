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
            NavigationLink(destination: HomeView()){
                Text("Home")
            }
            
            ForEach(1..<11) { i in
                NavigationLink(destination: DetailView(viewNumber: "\(i)")) {
                    Text("View \(i)")
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
