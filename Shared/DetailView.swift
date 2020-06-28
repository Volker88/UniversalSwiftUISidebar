//
//  DetailView.swift
//  Shared
//
//  Created by Volker Schmitt on 27.06.20.
//

import SwiftUI

struct DetailView: View {
    
    let viewNumber: String
    
    var body: some View {
        Text("DetailView \(viewNumber)")
            .customNavigationBarTitleModifier("DetailView")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewNumber: "1")
    }
}
