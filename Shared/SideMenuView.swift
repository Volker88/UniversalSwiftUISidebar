//
//  SideMenuView.swift
//  Shared
//
//  Created by Volker Schmitt on 26.06.20.
//


// MARK: - Import
import SwiftUI

// MARK: - Struct / Class Definition
struct SideMenuView: View {
    
    // MARK: - Define Constants / Variables
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void

    
    // MARK: - Body
    var body: some View {
        
        // MARK: - Return View
        return ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                GeometryReader { g in
                    NavigationBar()
                        .frame(width: self.width, alignment: .leading)
                        .background(Color.green)
                        .offset(x: self.isOpen ? 0 : -self.width - g.safeAreaInsets.leading)
                    
                    Spacer()
                }
            }
        }.onDisappear {
            print("Dismiss")
            menuClose()
        }
    }
}


// MARK: - Preview
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ColorScheme.light, .dark], id: \.self) { scheme in
            SideMenuView(width: 300, isOpen: true, menuClose: { })
                .colorScheme(scheme)
        }
    }
}

