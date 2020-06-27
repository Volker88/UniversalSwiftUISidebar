//
//  SwipeDirectionAPI.swift
//  Shared
//
//  Created by Volker Schmitt on 26.06.20.
//


// MARK: - Import
import SwiftUI


// MARK: - Struct / Class Definition
class SwipeDirectionAPI {
    
    enum SwipeDirection: String {
        case left, right, up, down, none
    }
    
    
    // MARK: - Methods
    static func detectDirection(value: DragGesture.Value) -> SwipeDirection {
        
        #if os(iOS)
        let deviceWidth = UIScreen.main.bounds.width
        let leftBorder = CGPoint(x: 50, y: 0)
        let rightBorder = CGPoint(x: deviceWidth - 50, y: 0)
        
        if value.startLocation.x < leftBorder.x && value.startLocation.x < value.location.x  {
            return .right
        }
        if value.startLocation.x > rightBorder.x && value.startLocation.x > value.location.x + 24 {
            return .left
        }
        if value.startLocation.y < value.location.y - 24 {
            return .down
        }
        if value.startLocation.y > value.location.y + 24 {
            return .up
        }
        #endif
        return .none
    }
}
