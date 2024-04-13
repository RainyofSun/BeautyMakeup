//
//  UUIDTool.swift
//  BeautyMakeup
//
//  Created by 刘冉 on 2024/4/13.
//

import UIKit
import KeychainAccess

class UUIDTool: NSObject {
    // 需要项目唯一性，建议使用项目的 bundleId
    static let KEYCHAIN_SERVICE: String = Bundle.main.bundleIdentifier ?? "com.KP.BeautyMakeup"
    static let UUID_KEY:String = "UUID_KEY"
    
    static func getUUID() -> String{
        let keychain = Keychain(service: KEYCHAIN_SERVICE)
        var uuid:String = ""
        do {
            uuid = try keychain.get(UUID_KEY) ?? ""
        } catch let error {
            print(error)
        }
        if uuid.isEmpty {
            uuid = UUID().uuidString
            do {
                try keychain.set(uuid, key: UUID_KEY)
            } catch let error {
                print(error)
                uuid = ""
            }
        }
        return uuid
    }
}
