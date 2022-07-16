//
//  File.swift
//  
//
//  Created by Vitalii Tielieusov on 16.07.2022.
//

import UIKit
import LocalAuthentication

public extension UIDevice {
    
    func isFaceIdSupported() -> Bool {
        if #available(iOS 11.0, *) {
            let context = LAContext()
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                return context.biometryType == LABiometryType.faceID
            }
        }

        return false
    }
    
    func isTouchIdSupported() -> Bool {
        if #available(iOS 11.0, *) {
            let context = LAContext()
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                return context.biometryType == LABiometryType.touchID
            }
        }

        return false
    }
    
//    var hasNotch: Bool {
//        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
//        return bottom > 0
//    }
    
    var hasNotch: Bool {
        guard #available(iOS 11.0, *), let window = UIApplication.shared.keyWindow else { return false }
        let orientation = UIApplication.shared.statusBarOrientation
        if orientation.isPortrait {
            return window.safeAreaInsets.top >= 44
        } else {
            return window.safeAreaInsets.left > 0 || window.safeAreaInsets.right > 0
        }
    }
}
