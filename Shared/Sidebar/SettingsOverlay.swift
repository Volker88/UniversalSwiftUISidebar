//
//  SettingsOverlay.swift
//  UniversalSideBar
//
//  Created by Volker Schmitt on 01.07.20.
//

import SwiftUI


struct SettingsOverlay: View {
    
    @State private var isPresented = false
    
    
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            HStack { Image(systemName: "gear")
                Text("Settings")
            }
            .padding()
            .customHoverEffect()
        })
        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50, alignment: .center)
        .background((Color.gray).opacity(0.3))
        .sheet(isPresented: $isPresented) {
            SettingsView()
        }
    }
}


struct SettingsOverlay_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsOverlay()
                .previewLayout(.sizeThatFits)
            SettingsOverlay()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
