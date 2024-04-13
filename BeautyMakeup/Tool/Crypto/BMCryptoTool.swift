//
//  BMCryptoTool.swift
//  BeautyMakeup
//
//  Created by 刘冉 on 2024/4/12.
//

import UIKit
import CryptoSwift

class BMCryptoTool: NSObject {
    // MARK: AES-ECB128 加密(128默认16位的key字符串)
    public static func endcodeAESECB(strToEncode: String, key: String) -> String {
        return BMCryptoBase.endcodeAES(strToEncode: strToEncode, key: key, blockMode: ECB(), padding: .pkcs5)
    }

    // MARK: AES-ECB128 解密
    public static func decodeAESECB(strToDecode: String, key: String) -> String {
        return BMCryptoBase.decodeAES(strToDecode: strToDecode, key: key, blockMode: ECB(), padding: .pkcs7)
    }

    // MARK: MD5 加密
    public static func MD5(codeString: String, salt: String) -> String {
        // 加盐加密
        return BMCryptoBase.MD5(codeString: codeString, salt: salt, saltIsFront: true)
    }
    
    public static func MD5(codeString: String) -> String {
        // 加盐加密
        return codeString.md5()
    }
}
