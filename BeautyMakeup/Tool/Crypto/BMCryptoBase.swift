//
//  BMCryptoBase.swift
//  BeautyMakeup
//
//  Created by 刘冉 on 2024/4/12.
//

import UIKit
import CryptoSwift

class BMCryptoBase: NSObject {
    // MARK: MD5 加盐加密
    public static func MD5(codeString: String, salt: String, saltIsFront: Bool) -> String {
        var md5String = ""
        if saltIsFront == true {
            md5String = (salt + codeString).md5()
        } else {
            md5String = (codeString + salt).md5()
        }
        return md5String
    }

    // MARK: AES加密
    public static func endcodeAES(strToEncode: String, key: String, blockMode: BlockMode, padding: Padding = .pkcs7) -> String {
        var encrypted: [UInt8] = []
        do {
            encrypted = try AES(key: key.bytes, blockMode: blockMode, padding: padding).encrypt(strToEncode.bytes)
        } catch {
        }
        let encoded = Data(encrypted)
        let encodeStr = encoded.base64EncodedString()
        return encodeStr
    }

    // MARK: AES解密
    public static func decodeAES(strToDecode: String, key: String, blockMode: BlockMode, padding: Padding = .pkcs7) -> String {
        // 字符串转十六进制
        let encrypted = [UInt8](hex: "0x" + strToDecode)
        // AES解密
        var decrypted: [UInt8] = []
        do {
            decrypted = try AES(key: key.bytes, blockMode: blockMode, padding: padding).decrypt(encrypted)
        } catch {
        }
        // byte转换成Data
        let encoded = Data(decrypted)
        var str = ""
        // 解密结果从Data转成string
        str = String(bytes: encoded.bytes, encoding: .utf8)!
        return str
    }
}
