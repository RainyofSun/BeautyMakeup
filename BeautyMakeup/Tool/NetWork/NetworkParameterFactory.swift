//
//  NetworkParameterFactory.swift
//  BeautyMakeup
//
//  Created by 刘冉 on 2024/4/12.
//

import UIKit

class NetworkParameterFactory: NSObject {
    /// 加密参数
    class func cryptoNetworkParams(_ params: [String: Any]? = nil) -> [String: Any] {
        let common_params = self.commonParameters()
        if let _p = params {
            common_params.addEntries(from: _p)
        }
        let combine_str: String = self.combineNetworkParams(common_params)
        let crypto_str: String = BMCryptoTool.endcodeAESECB(strToEncode: combine_str, key: BM_CRYPTO_KEY)
        let url_encode: String = crypto_str.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")) ?? ""
        return ["__product_step__": "1", "data": crypto_str]
    }
}

private extension NetworkParameterFactory {
    class func commonParameters() -> NSMutableDictionary {
        let common_parameter = NSMutableDictionary()
        common_parameter.setValue("ios", forKey: "os")
        common_parameter.setValue("pickmepro", forKey: "channel")
        common_parameter.setValue(Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String, forKey: "version_name")
        common_parameter.setValue(Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String, forKey: "version_code")
        common_parameter.setValue("apple", forKey: "brand")
        common_parameter.setValue(UIDevice.current.model, forKey: "model")
        common_parameter.setValue(Date().timeIntervalSince1970, forKey: "timer")
        common_parameter.setValue(UUIDTool.getUUID(), forKey: "uuid")
        common_parameter.setValue("0", forKey: "is_root")
        common_parameter.setValue("1", forKey: "sex")
        common_parameter.setValue("1", forKey: "imsi")
        common_parameter.setValue("gaoxing", forKey: "appKey")
        common_parameter.setValue("", forKey: "oaid")
        common_parameter.setValue(UIDevice.current.batteryLevel, forKey: "is_emulator")
        common_parameter.setValue("", forKey: "adjust_id")
        common_parameter.setValue(UIDevice.networkStatus, forKey: "net")
//        common_parameter.setValue(UserDefaults.userInfo.identity, forKey: "identity")
        common_parameter.setValue(String(Locale.current.languageCode ?? "zh").lowercased(), forKey: "language")
//        common_parameter.setValue(UserDefaults.userInfo.user_id, forKey: "user_id")
//        common_parameter.setValue(UserDefaults.userInfo.nickname, forKey: "nickname")
        common_parameter.setValue(Bundle.main.bundleIdentifier, forKey: "package_name")
        
        return common_parameter
    }
    
    // 组合参数
    class func combineNetworkParams(_ params: NSMutableDictionary) -> String {
        var para_array: [String] = []
        // 数组key首字母排序
        let all_keys_array: [String] = NSArray(array: params.allKeys) as? [String] ?? []
        let sorted_keys = all_keys_array.sorted()
        // 处理参数
        sorted_keys.forEach { subKey in
            let tempKey = subKey
            let value = params[tempKey]
            if value != nil {
                let tempValue: String = "\(params[tempKey] ?? "")"
                let keyValueStr = tempKey + "=" + tempValue
                para_array.append(keyValueStr)
            }
        }
        let result = NSMutableArray(array: para_array).componentsJoined(by: "&")
        // 首字母再加一个&
        return result
    }
}
