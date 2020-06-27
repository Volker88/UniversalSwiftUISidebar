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
            ForEach(0..<10) { i in
                NavigationLink(destination: DetailView()) {
                    Text("View \(i)")
                }  
            }
        }
        .listStyle(SidebarListStyle())
        //.navigationBarTitle("Navigation", displayMode: .inline)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
