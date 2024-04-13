//
//  NetworkErrorHandler.swift
//  Living
//
//  Created by Eric on 2023/10/26.
//

import UIKit

// MARK: 错误代码
/// TOEKN 失效
let TOKEN_EXPIRED: Int = 401
/// 服务器错误
let SERVICE_ERROR: Int = 500
/// JSON 解析失败
let JSON_SERIALIZATION_ERROR: Int = 1000000
/// 无网络
let NETWORK_ERROR: Int = 9999

/// 错误处理
/// - Parameters:
///   - code: code码
///   - message: 错误消息
///   - needShowFailAlert: 是否显示网络请求失败的弹框
///   - failure: 网络请求失败的回调
func errorHandler(error: ErrorResponse, needShowFailAlert: Bool = false, failure: ((ErrorResponse) -> Void)? = nil) {
    var errorMessage: String = error.message
    if error.code == TOKEN_EXPIRED {
        errorMessage = "token 失效"
    } else if error.code == SERVICE_ERROR {
        errorMessage = "服务器开小差儿了...."
    } else if error.code == JSON_SERIALIZATION_ERROR {
        errorMessage = "JSON 解析失败"
    } else if error.code == NETWORK_ERROR {
        errorMessage = "网络走失了...."
    }
    if needShowFailAlert {
        // 展示弹窗
    }
    CocoaLog.error("Net Request Error: code = \(error.code) message = \(errorMessage)")
    failure?(error)
}
