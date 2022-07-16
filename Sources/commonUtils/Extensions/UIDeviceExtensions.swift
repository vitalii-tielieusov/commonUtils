//
//  File.swift
//  
//
//  Created by Vitalii Tielieusov on 16.07.2022.
//

import UIKit
import LocalAuthentication

public extension UIDevice {
    
    static func getBiometricsType() -> LABiometryType {
        let context = LAContext()
        var error: NSError?
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            return .none
        }
        return context.biometryType
    }
    
    static func isThereFaceId() -> Bool {
        switch getBiometricsType() {
        case .faceID:
            return true
        default:
            return false
        }
    }
}
