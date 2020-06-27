//
//  DeviceInformation.swift
//  Shared
//
//  Created by Volker Schmitt on 27.06.20.
//

import Foundation
import SwiftUI

#if os(iOS)
class DeviceInformation {
    
    
    func getDeviceInformation() -> (UIUserInterfaceIdiom, UIDeviceOrientation){
        let device: UIUserInterfaceIdiom
        let orientation: UIDeviceOrientation
        
        switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                device = .phone
            case .pad:
                device = .pad
            case .mac:
                device = .mac
            case .tv:
                device = .tv
            case .carPlay:
                device = .carPlay
            case .unspecified:
                device = .unspecified
            @unknown default:
                device = .unspecified
        }
        
        switch UIDevice.current.orientation {
            case .faceUp:
                orientation = .faceUp
            case .faceDown:
                orientation = .faceDown
            case .landscapeLeft:
                orientation = .landscapeLeft
            case .landscapeRight:
                orientation = .landscapeRight
            case .portrait:
                orientation = .portrait
            case .portraitUpsideDown:
                orientation = .portraitUpsideDown
            case .unknown:
                orientation = .unknown
            @unknown default:
                orientation = .unknown
        }
        return (device, orientation)
    }
    
    func getDeviceOrientation() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            
            if UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown  {
                print("iPad Protrait")
            } else if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
                print("iPad Landscape")
            }

        } else if UIDevice.current.userInterfaceIdiom == .phone {
            
            
            if UIDevice.current.orientation == .portrait || UIDevice.current.orientation == .portraitUpsideDown  {
                print("iPhone Protrait")
            } else if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
                print("iPhone Landscape")
            }
        } else if UIDevice.current.userInterfaceIdiom == .mac {
                print("Mac")
        }
    }
}
    #endif
