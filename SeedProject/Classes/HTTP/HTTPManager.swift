//
//  HTTPManager.swift
//  SeedProject
//
//  Created by 冯奕骅 on 2018/6/10.
//  Copyright © 2018年 冯奕骅. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct HTTPManager {

    static let shared = HTTPManager()

    private init() {}

    /// 统一API请求方法
    ///
    /// - Parameters:
    ///   - baseURL: 服务器根路径
    ///   - path: API具体路径
    ///   - method: HTTP方法
    ///   - params: 参数
    ///   - success: 请求成功时的回调，传入的参数是response.data
    ///   - finally: 最终回调
    func request(baseURL: String = BASE_URL, path: String, method: HTTPMethod = .get, params: [String: Any]? = nil, success: @escaping (JSON) -> (), finally: (() -> ())? = nil) {
        Alamofire.request(baseURL + path, method: method, parameters: params)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let code = json["code"].numberValue
                    if code != 20000 {
                        // code为非"20000"时都表示业务错误
                    } else {
                        success(json["data"])
                    }
                case .failure(_):
                    NotificationCenter.default.post(custom: .networkNotReachable, object: nil)
                }
                finally?()
        }
    }

}
