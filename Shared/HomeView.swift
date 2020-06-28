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
    
    var body: some View {
        
        return ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(data, id: \.self) { image in
                    
                    NavigationLink(destination: PictureView(name: "\(image)")){
                        Image(image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .customNavigationBarTitleModifier("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
