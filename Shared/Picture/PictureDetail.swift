//
//  PictureDetail.swift
//  UniversalSideBar
//
//  Created by Volker Schmitt on 01.07.20.
//

import SwiftUI

struct PictureDetail: View {
    
    let name: String
    @Binding var isPresented: Bool

    
    var backButton: some View {
        Button(action: {
            isPresented.toggle()
        }, label: {
            HStack {
                Image(systemName: "xmark")
                Text("Close")
            }
        })
    }
    
    var content: some View {
            Image("\(name)")
                .resizable()
                .aspectRatio(contentMode: .fit)
    }
    
    
    @ViewBuilder
    var body: some View {
        #if os(macOS)
        ZStack(alignment: .topLeading) {
            content
            backButton
                .offset(x: 10, y: 10)
        }
        .toolbar { Spacer() }
        .navigationTitle("Picture Nr. \(name)")
        #elseif os(iOS)
        content
            .navigationBarTitle("Picture Nr. \(name)", displayMode: .inline)
        #endif
    }
    
}

struct PictureDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PictureDetail(name: "4", isPresented: .constant(true))
            PictureDetail(name: "4", isPresented: .constant(true))
                .preferredColorScheme(.dark)
        }
    }
}
