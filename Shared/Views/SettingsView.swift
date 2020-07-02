//
//  SettingsView.swift
//  UniversalSideBar
//
//  Created by Volker Schmitt on 01.07.20.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var content: some View {
        VStack {
            Text("This is the SettingsView for all kind of App Settings")
            #if os(iOS)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Image(systemName: "xmark")
                    Text("Close")
                }
                .padding(5)
                .background(Color.gray)
                .cornerRadius(20)
                .customHoverEffect()
            })
            #endif
        }
        .navigationTitle("Settings")
    }
    
    @ViewBuilder
    var body: some View {
        
        #if os(macOS)
        content
            .frame(minWidth: 200, idealWidth: 250, maxWidth: 300, minHeight: 200, idealHeight: 250, maxHeight: 300, alignment: .center)
        #elseif os(iOS)
        content
        #endif
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
            SettingsView()
                .preferredColorScheme(.dark)
        }
    }
}
