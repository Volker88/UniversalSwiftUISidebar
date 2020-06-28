//
//  PictureView.swift
//  UniversalSwiftUISidebar
//
//  Created by Volker Schmitt on 28.06.20.
//

import SwiftUI

struct PictureView: View {
    
    let name: String
    
    init(name: String) {
        self.name = name
        print(name)
    }
    
    var body: some View {
        Image("\(name)")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView(name: "1")
    }
}
