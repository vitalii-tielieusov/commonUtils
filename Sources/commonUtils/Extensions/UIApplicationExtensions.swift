//
//  UIApplicationExtensions.swift
//  Inspire me
//
//  Created by Vitaliy Teleusov on 27.12.2021.
//

import UIKit

public extension UIApplication {
    
    class var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    class var buildVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
    
    class var appAndBuildVersion: String? {
        guard let buildVersionNumber = buildVersion else { return appVersion }
        guard let appVersionNumber = appVersion else { return buildVersionNumber }
        
        return "\(appVersionNumber) (\(buildVersionNumber))"
    }
    
    class var itunesConnectAppId: String {//TODO: Should setup own app ID
        return "1484592473"
    }
    
    class var itunesConnectAppLink: URL? {
        return URL(string: "https://apps.apple.com/app/id" + UIApplication.itunesConnectAppId)
    }
    
    class var osVesion: String? {
        let osInfo: String = {
            let version = ProcessInfo.processInfo.operatingSystemVersion
            let versionString = "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
            
            let osName: String = {
#if os(iOS)
                return "iOS"
#elseif os(watchOS)
                return "watchOS"
#elseif os(tvOS)
                return "tvOS"
#elseif os(macOS)
                return "OS X"
#elseif os(Linux)
                return "Linux"
#else
                return "Unknown"
#endif
            }()
            
            return "\(osName) \(versionString)"
        }()
        return osInfo
    }
}

