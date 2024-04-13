//
//  UIDeviceExtension.swift
//  Living
//
//  Created by Eric on 2023/10/25.
//

import UIKit
import Alamofire

extension UIDevice {
    static var isNetworkConnect: Bool {
        let network = NetworkReachabilityManager()
        return network?.isReachable ?? true
    }
    
    static var networkStatus: String {
        guard let network = NetworkReachabilityManager() else {
            return "无网络连接"
        }
        
        if network.isReachable {
            if network.isReachableOnCellular {
                return "蜂窝数据"
            }  else if network.isReachableOnEthernetOrWiFi {
                return "Wi-Fi"
            } else {
                return "未知网络类型"
            }
        } else {
            return "无网络连接"
        }
    }
}
