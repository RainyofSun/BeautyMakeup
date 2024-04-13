//
//  ResponsePluginType.swift
//  Living
//
//  Created by Eric on 2023/10/25.
//

import UIKit
import Moya
import SwiftyJSON
import Alamofire

private let responseDataKey = "data"
private let responseCodeKey = "code"
private let successCode: Int = 1

class ResponsePluginType: PluginType {
    // 准备发起请求,可以在这里对请求进行修改，比如再增加一些额外的参数。
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        return request
    }
    
    // 开始发起请求
    func willSend(_ request: RequestType, target: TargetType) {
        
    }
    
    // 收到请求响应
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        
        switch result {
        case .success(_): break
        case .failure(let failure):
            errorHandler(error: ErrorResponse(code: failure.errorCode, message: failure.localizedDescription))
        }
    }
    
    // 处理请求结果。我们可以在 completion 前对结果进行进一步处理。
    func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
        switch result {
        case .success(let response):
            let newResponse = getResponse(response: response)
            if newResponse.statusCode == successCode {
                return .success(newResponse)
            } else {
                errorHandler(error: ErrorResponse(code: newResponse.statusCode))
                return .failure(MoyaError.jsonMapping(newResponse))
            }
        case .failure(_):
            break
        }
        return result
    }
    
    // 非标准rest返回需要加工一下
    func getResponse(response: Response) -> Response {
        let json = JSON(response.data)
        do {
            let data = try json[responseDataKey].rawData()
            return Response(statusCode: json[responseCodeKey].intValue, data: data, request: response.request, response: response.response)
        } catch {
            return Response(statusCode: json[responseCodeKey].intValue, data: Data(), request: response.request, response: response.response)
        }
    }
}
